import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/utils/router.dart';
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

  @override
  void initState() {
    super.initState();
    _getData(false);
  }

  Future<void> _getData(bool isLoadMore) async {
    try {
      var currentPage = isLoadMore ? _currentPage + 1 : 1;
      var params = UserPageQueryDto(
        pagination: Pagination(
          page: _currentPage,
          limit: 10,
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('用户管理'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_resultDatas?[index].name ?? ''),
            subtitle: Text('共有$_pages页'),
          );
        },
        itemCount: _resultDatas?.length ?? 0,
      ),
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
