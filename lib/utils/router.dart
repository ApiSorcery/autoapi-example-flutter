import 'package:autoapi_example_flutter/pages/user.dart';
import 'package:autoapi_example_flutter/pages/user_detail.dart';
import 'package:flutter/material.dart';

class Routes {
  /// User list page
  static const user = '/user';

  /// User add page
  static const userDetail = '/user/detail';

  static Widget _navi(String url, dynamic params) {
    switch (url) {
      case user:
        return const UserPage();
      case userDetail:
        return UserDetailPage(params);
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
