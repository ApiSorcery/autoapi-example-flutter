import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      debugPrint("【${options.hashCode}】Request baseUrl: ${options.baseUrl}");
      debugPrint("【${options.hashCode}】Request url: ${options.path}");
      debugPrint('【${options.hashCode}】Request headers: ${options.headers}');
      if (options.method == 'GET') {
        debugPrint('【${options.hashCode}】Request parameters: ${options.queryParameters}');
      } else {
        if (options.data != null) {
          debugPrint('【${options.hashCode}】Request data: ${options.data}');
        }
      }
    }

    handler.next(options);
  }
}
