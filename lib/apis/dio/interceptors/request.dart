import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:autoapi_example_flutter/utils/config.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      debugPrint("【${options.hashCode}】请求baseUrl：${Config.apiHost}");
      debugPrint("【${options.hashCode}】请求url：${options.path}");
      debugPrint('【${options.hashCode}】请求头: ${options.headers}');
      if (options.method == 'GET') {
        debugPrint('【${options.hashCode}】请求参数: ${options.queryParameters}');
      } else {
        if (options.data != null) {
          debugPrint('【${options.hashCode}】请求参数: ${options.data}');
        }
      }
    }

    handler.next(options);
  }
}
