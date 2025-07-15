import 'package:autoapi_example_flutter/pages/user.dart';
import 'package:autoapi_example_flutter/pages/user_add.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String user = '/user';
  static const String userAdd = '/user/add';

  static Widget _navi(String url, dynamic params) {
    switch (url) {
      case user:
        return const UserPage();
      case userAdd:
        return const UserAddPage();
      default:
        return const SizedBox.shrink();
    }
  }

  static Future push(BuildContext context, String url, dynamic params) async {
    FocusScope.of(context).requestFocus(FocusNode());
    return await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _navi(url, params);
    }));
  }
}
