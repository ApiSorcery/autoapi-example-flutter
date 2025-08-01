import 'dart:convert';
import 'dart:io';

import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/entities/key_value.dart';
import 'package:autoapi_example_flutter/utils/constants.dart';
import 'package:autoapi_example_flutter/utils/datetime.dart';
import 'package:autoapi_example_flutter/utils/router.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/card.dart';
import 'package:autoapi_example_flutter/widgets/command_footer.dart';
import 'package:autoapi_example_flutter/widgets/dialogs.dart';
import 'package:autoapi_example_flutter/widgets/filter.dart';
import 'package:autoapi_example_flutter/widgets/loading.dart';
import 'package:autoapi_example_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html; // for web file download
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late BuildContext _scaffoldContext;
  List<UserInfoDto>? _resultDatas;
  int _currentPage = 1; // Current page
  int? _pages; // Total pages
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  KeyValue? _userStatusKv;
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    _getData(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_pages != null && _pages! >= _currentPage) {
          _getData(true);
        } else {
          toastInfo(context, 'Reached the end');
        }
      }
    });
  }

  Future<void> _getData(bool isLoadMore) async {
    try {
      var currentPage = isLoadMore ? _currentPage + 1 : 1;
      var params = UserPageQueryDto(
        pagination: Pagination(
          page: currentPage,
          limit: 10,
        ),
        code: _userCodeController.text,
        name: _userNameController.text,
        status: _userStatusKv == null ? null : (_userStatusKv!.id == 'true'),
      );
      var response = await ApiUser.getUserPaged(params);
      setState(() {
        _pages = ((response.total ?? 0) / 10).ceil();
        _currentPage = currentPage;
        if (isLoadMore) {
          _resultDatas?.addAll(response.results ?? <UserInfoDto>[]);
        } else {
          _resultDatas = response.results ?? <UserInfoDto>[];
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clear() {
    setState(() {
      _userCodeController.clear();
      _userNameController.clear();
      _userStatusKv = null;
    });
  }

  void commit() {
    Navigator.pop(context);
    _refreshIndicatorKey.currentState?.show();
  }

  DropdownButton _getUserStatus() {
    return DropdownButton<KeyValue>(
      isExpanded: true,
      value: _userStatusKv,
      onChanged: (KeyValue? newValue) {
        setState(() {
          _userStatusKv = newValue;
        });
      },
      items: userStatusConst.map((KeyValue value) {
        return DropdownMenuItem<KeyValue>(
          value: value,
          child: Text(value.name, style: AppTextStyle.filterValue),
        );
      }).toList(),
    );
  }

  Drawer filter() {
    return Drawer(
      child: Column(children: <Widget>[
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            const ListTile(
                title: Text('Quick Search', style: AppTextStyle.filterTitle)),
            filterInput(context, 'User Code:', _userCodeController),
            filterInput(context, 'User Name:', _userNameController),
            filterSelect('User Status:', _getUserStatus()),
          ],
        ),
        filterButton(context, clear, commit)
      ]),
    );
  }

  /// Delete user
  _handleRemoveUser(BuildContext context, UserInfoDto item) async {
    bool? isConfirm = await showConfirmDialog(
        context: context, title: 'Tip', content: 'Are you sure you want to delete the current user?');
    if (isConfirm == true) {
      var params = RemoveUserRequest(id: item.id!);
      await ApiUser.removeUser(params);
      if (mounted) {
        await ScaffoldMessenger.of(_scaffoldContext)
            .showSnackBar(const SnackBar(
                duration: Duration(seconds: 1), content: Text("Operation successful")))
            .closed;
      }

      _refreshIndicatorKey.currentState?.show();
    }
  }

  Future _handleAdd(BuildContext context) async {
    bool? isSuccess =
        await Routes.push(context, Routes.userDetail, {'operateType': 'add'});
    if (isSuccess == true) {
      _refreshIndicatorKey.currentState?.show();
    }
  }

  Future _handleExport(BuildContext context) async {
    try {
      if (_isExporting) {
        return;
      }

      setState(() {
        _isExporting = true;
      });

      // Check storage permission (non-web platforms only)
      if (!kIsWeb) {
        var status = await Permission.storage.request();
        if (!status.isGranted) {
          if (mounted) {
            toastWarning(_scaffoldContext, 'Storage permission is required to export files');
          }
          setState(() {
            _isExporting = false;
          });
          return;
        }
      }

      // Get export file content
      var req = ExportUsersRequest(
        code: _userCodeController.text,
        name: _userNameController.text,
      );
      BlobResp? blobRes = await ApiUser.exportUsers(req);
      if (blobRes != null) {
        var fileBytes = blobRes.data;
        if (fileBytes != null) {
          String fileName = blobRes.name ??
              'users_${DateTime.now().millisecondsSinceEpoch}.xlsx';
          if (kIsWeb) {
            // Web: Use AnchorElement to trigger download
            final blob = html.Blob([fileBytes]);
            final url = html.Url.createObjectUrlFromBlob(blob);
            html.AnchorElement(href: url)
              ..setAttribute('download', fileName)
              ..click();
            html.Url.revokeObjectUrl(url);
            if (mounted) {
              await ScaffoldMessenger.of(_scaffoldContext)
                  .showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1), content: Text("Export successful")))
                  .closed;
            }
          } else {
            // Mobile/Desktop: Save to file system
            Directory? directory = await getExternalStorageDirectory();
            if (directory == null) {
              if (mounted) {
                toastWarning(_scaffoldContext, 'Unable to access storage directory');
              }
              setState(() {
                _isExporting = false;
              });
              return;
            }
            String filePath = '${directory.path}/$fileName';
            File(filePath)
              ..createSync(recursive: true)
              ..writeAsBytesSync(fileBytes);

            if (mounted) {
              await ScaffoldMessenger.of(_scaffoldContext)
                  .showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1), content: Text("Export successful")))
                  .closed;
            }
          }
        }
      } else {
        if (mounted) {
          toastWarning(_scaffoldContext, 'Export failed');
        }
      }
      setState(() {
        _isExporting = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        toastWarning(_scaffoldContext, 'Export failed: ${e.toString()}');
      }
      setState(() {
        _isExporting = false;
      });
    }
  }

  Widget userCard(BuildContext context, UserInfoDto item) {
    return Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
        child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Column(
              children: [
                cardTitleStatus(context, '${item.name} - ${item.code}',
                    item.status.toString(), userStatusConst),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Divider(color: Color.fromRGBO(0, 0, 0, 0.3)),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: (item.avatar ?? '').isEmpty
                                  ? MemoryImage(
                                          base64.decode(defaultImageBase64))
                                      as ImageProvider
                                  : NetworkImage(item.avatar!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Column(children: <Widget>[
                          cardSelect(
                              title: 'Gender:',
                              value: item.gender.toString(),
                              options: userGenderConst),
                          cardText('Email:', item.email),
                          cardText('Address:', item.address),
                          cardText(
                              'Created Time:',
                              item.createdAt != null
                                  ? DateTimeUtil.formatDateTime(item.createdAt!)
                                  : ''),
                        ]))
                      ],
                    )),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('User Management'),
      ),
      endDrawer: filter(),
      body: _resultDatas == null
          ? const Loading()
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () => _getData(false),
              child: _resultDatas!.isEmpty
                  ? cardEmpty()
                  : ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      itemCount: _resultDatas?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = _resultDatas![index];
                        return GestureDetector(
                            onTap: () async {
                              bool? isSuccess = await Routes.push(
                                  context, Routes.userDetail, {
                                'operateType': 'edit',
                                'userId': item.id,
                              });
                              if (isSuccess == true) {
                                _refreshIndicatorKey.currentState?.show();
                              }
                            },
                            child: item.status == false
                                ? Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.2,
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) =>
                                              _handleRemoveUser(context, item),
                                          backgroundColor: Colors.transparent,
                                          foregroundColor: Colors.red,
                                          padding: EdgeInsets.only(right: 20),
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ],
                                    ),
                                    child: userCard(context, item))
                                : userCard(context, item));
                      },
                    )),
      bottomNavigationBar: CommandFooter(
        commandFooterData: CommandFooterData(
          details: [],
          commandsTitle: 'Actions',
          commands: [
            FooterCommand('Add User', _handleAdd),
            FooterCommand('Export', _handleExport)
          ],
        ),
      ),
    );
  }
}
