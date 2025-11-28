import 'dart:typed_data';
import 'package:web/web.dart' as web;
import 'package:js/js_util.dart' as js_util;

/// 仅在 Web 编译环境下被条件导入，用于触发浏览器下载
Future<void> triggerWebDownload(List<int> bytes, String fileName) async {
  final uint8 = Uint8List.fromList(bytes);
  final blob = web.Blob(js_util.jsify([uint8]) as dynamic);
  final urlObject = js_util.getProperty(web.window, 'URL');
  final url = js_util.callMethod(urlObject, 'createObjectURL', [blob]);
  final anchor = web.document.createElement('a');
  anchor.setAttribute('href', url);
  anchor.setAttribute('download', fileName);
  web.document.body?.append(anchor);
  js_util.callMethod(anchor, 'click', []);
  anchor.remove();
  js_util.callMethod(urlObject, 'revokeObjectURL', [url]);
}
