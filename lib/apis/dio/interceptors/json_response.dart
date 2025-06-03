import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class JsonResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('【${response.requestOptions.hashCode}】返回结果: $response');
    }

    // 业务异常处理 (0：正常)
    if (response.data['status'] != 0) {
      throw DioException(
          requestOptions: response.requestOptions,
          type: DioExceptionType.badResponse,
          response: Response(
              requestOptions: response.requestOptions,
              statusCode: response.data['status'],
              statusMessage: response.data['message']));
    }

    if (response.data != null) {
      response.data = response.data['data'];
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('请求异常: $err');
      debugPrint('请求异常信息: ${err.response?.toString() ?? ""}');
    }

    handler.next(err);
  }
}
