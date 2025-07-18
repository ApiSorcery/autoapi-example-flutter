import 'package:autoapi_example_flutter/pages/user.dart';
import 'package:autoapi_example_flutter/pages/user_add.dart';
import 'package:autoapi_example_flutter/widgets/photo/photo_gallery.dart';
import 'package:flutter/material.dart';

class Routes {
  /// 图片预览页
  static const imgView = "/imgView";

  /// 用户列表页
  static const user = '/user';

  /// 用户添加页
  static const userAdd = '/user/add';

  static Widget _navi(String url, dynamic params) {
    switch (url) {
      case imgView:
        return PhotoGalleryPage(params);
      case user:
        return const UserPage();
      case userAdd:
        return UserAddPage(params);
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
