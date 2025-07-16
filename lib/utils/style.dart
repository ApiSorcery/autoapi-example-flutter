import 'package:flutter/material.dart';

// 文本样式
class AppTextStyle {
  /// 主题色
  static const primaryColor = Color(0xFF004099);

  /// 查询抽屉标题
  static const filterTitle =
      TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);

  /// 查询-标签
  static const filterLabel =
      TextStyle(color: Color.fromRGBO(115, 115, 115, 1), fontSize: 14);

  /// 查询-值
  static const filterValue = TextStyle(
    color: Color(0xFF111111),
    fontSize: 15.0,
  );

}
