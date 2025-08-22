import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

// Toast notification
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
    autoCloseDuration: const Duration(seconds: 3),
  );
}

// Toast notification
toastWarning(BuildContext context, String msg) {
  return toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(
      msg,
      softWrap: true,
    ),
    type: ToastificationType.warning,
    style: ToastificationStyle.flat,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 5),
  );
}