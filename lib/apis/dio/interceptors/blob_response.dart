import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BlobResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('【${response.requestOptions.hashCode}】返回结果: $response');
    }

    // 返回blob格式，文件下载
    if (response.data is Uint8List) {
      var contentDisposition = response.headers.value('content-disposition');
      response.data = BlobResp(
          data: response.data,
          type: response.headers.value('content-type') ?? '',
          name: Uri.decodeComponent(contentDisposition
                  ?.substring(contentDisposition.indexOf('=') + 1) ??
              ''));
    }
    // 业务异常处理 (0：正常)
    else if (response.data['status'] != 0) {
      throw DioException(
          requestOptions: response.requestOptions,
          type: DioExceptionType.badResponse,
          response: Response(
              requestOptions: response.requestOptions,
              statusCode: response.data['status'],
              statusMessage: response.data['message']));
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
