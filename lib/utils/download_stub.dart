/// 非 Web 平台实现：将导出的字节写入本地文件系统，并返回保存路径。
library;

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String?> triggerWebDownload(List<int> bytes, String fileName) async {
  final Directory dir = await getApplicationDocumentsDirectory();
  final String filePath = '${dir.path}/$fileName';
  final file = File(filePath);
  await file.create(recursive: true);
  await file.writeAsBytes(bytes, flush: true);
  return filePath;
}
