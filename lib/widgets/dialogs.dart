import 'package:autoapi_example_flutter/utils/style.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String confirmText = '确认',
    String cancelText = '取消'}) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(cancelText, style: AppTextStyle.dialogCancelButton),
            onPressed: () => Navigator.of(context).pop(), //关闭对话框
          ),
          TextButton(
            child: Text(confirmText, style: AppTextStyle.dialogConfirmButton),
            onPressed: () {
              Navigator.of(context).pop(true); //关闭对话框
            },
          ),
        ],
      );
    },
  );
}
