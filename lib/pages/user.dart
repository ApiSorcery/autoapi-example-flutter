import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/entities/key_value.dart';
import 'package:autoapi_example_flutter/utils/constants.dart';
import 'package:autoapi_example_flutter/utils/datetime.dart';
import 'package:autoapi_example_flutter/utils/router.dart';
import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:autoapi_example_flutter/widgets/card.dart';
import 'package:autoapi_example_flutter/widgets/filter.dart';
import 'package:autoapi_example_flutter/widgets/loading.dart';
import 'package:autoapi_example_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserInfoDto>? _resultDatas;
  int _currentPage = 1; // 当前页
  int? _pages; // 总页数
  final ScrollController _scrollController = ScrollController();
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
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
            filterInput('用户编号：', _userCodeController),
            filterInput('用户名称：', _userNameController),
            filterSelect('用户状态：', _getUserStatus()),
          ],
        ),
        filterButton(clear, commit)
      ]),
    );
  }

  Widget userCard(BuildContext context, UserInfoDto item) {
    return Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 8),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          elevation: 2,
          child: Column(children: <Widget>[
            cardTitleStatus(context, '${item.name} - ${item.code}',
                item.status.toString(), userStatusConst),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Divider(color: Color.fromRGBO(0, 0, 0, 0.3)),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: cardSelect(
                          title: '性别：',
                          value: item.gender.toString(),
                          options: userGenderConst)),
                  Expanded(child: cardText('邮箱：', item.email)),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: cardText('地址：', item.address)),
                  Expanded(
                      child: cardText(
                          '创建时间：',
                          item.createdAt != null
                              ? DateTimeUtil.formatDateTime(item.createdAt!)
                              : '')),
                ]),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                      itemCount: _resultDatas?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = _resultDatas![index];
                        return userCard(context, item);
                      },
                    )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes.push(context, Routes.userAdd, null);
        },
        tooltip: '添加用户',
        child: const Icon(Icons.add),
      ),
    );
  }
}
