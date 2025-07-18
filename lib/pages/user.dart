import 'dart:convert';

import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/entities/key_value.dart';
import 'package:autoapi_example_flutter/utils/constants.dart';
import 'package:autoapi_example_flutter/utils/datetime.dart';
import 'package:autoapi_example_flutter/utils/router.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/card.dart';
import 'package:autoapi_example_flutter/widgets/dialogs.dart';
import 'package:autoapi_example_flutter/widgets/filter.dart';
import 'package:autoapi_example_flutter/widgets/loading.dart';
import 'package:autoapi_example_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late BuildContext _scaffoldContext;
  List<UserInfoDto>? _resultDatas;
  int _currentPage = 1; // 当前页
  int? _pages; // 总页数
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  KeyValue? _userStatus;

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
          toastInfo(context, '已经到底了');
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
        status: _userStatus == null ? null : (_userStatus!.id == 'true'),
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
      _userStatus = null;
    });
  }

  void commit() {
    Navigator.pop(context);
    _refreshIndicatorKey.currentState?.show();
  }

  DropdownButton _getUserStatus() {
    return DropdownButton<KeyValue>(
      isExpanded: true,
      value: _userStatus,
      onChanged: (KeyValue? newValue) {
        setState(() {
          _userStatus = newValue;
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
                title: Text('快速查找', style: AppTextStyle.filterTitle)),
            filterInput(context, '用户编号：', _userCodeController),
            filterInput(context, '用户名称：', _userNameController),
            filterSelect('用户状态：', _getUserStatus()),
          ],
        ),
        filterButton(context, clear, commit)
      ]),
    );
  }

  /// 删除用户
  _handleRemoveUser(BuildContext context, UserInfoDto item) async {
    bool? isConfirm = await showConfirmDialog(
        context: context, title: '提示', content: '确认要删除当前用户吗?');
    if (isConfirm == true) {
      var params = RemoveUserRequest(id: item.id!);
      await ApiUser.removeUser(params);
      if (mounted) {
        await ScaffoldMessenger.of(_scaffoldContext)
            .showSnackBar(const SnackBar(
                duration: Duration(seconds: 1), content: Text("操作成功")))
            .closed;
      }

      _refreshIndicatorKey.currentState?.show();
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
                              title: '性别：',
                              value: item.gender.toString(),
                              options: userGenderConst),
                          cardText('邮箱：', item.email),
                          cardText('地址：', item.address),
                          cardText(
                              '创建时间：',
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
        title: const Text('用户管理'),
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
                                          label: '删除',
                                        ),
                                      ],
                                    ),
                                    child: userCard(context, item))
                                : userCard(context, item));
                      },
                    )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSuccess = await Routes.push(
              context, Routes.userDetail, {'operateType': 'add'});
          if (isSuccess == true) {
            _refreshIndicatorKey.currentState?.show();
          }
        },
        tooltip: '添加用户',
        child: const Icon(Icons.add),
      ),
    );
  }
}
