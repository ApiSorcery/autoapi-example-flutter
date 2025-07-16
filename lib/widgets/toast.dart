import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

// 提示框
toastInfo(BuildContext context, String msg) {
  return toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(
      msg,
      softWrap: true,
    ),
    type: ToastificationType.info,
    style: ToastificationStyle.simple,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 1),
  );
}