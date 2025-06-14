import 'package:dio/dio.dart';

import '../../dio/clients/blob.dart';
import '../../dio/clients/json.dart';
import 'model.dart';

Future<Response> createJsonRequest({
  required String url,
  required String method,
  String contentType = 'application/json',
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? data,
}) async {
  var dioClient = await DioJsonClient.getInstance();
  return dioClient.request(url,
      options: Options(method: method, contentType: contentType),
      queryParameters: queryParameters,
      data: data);
}

Future<Response> createNoParamsJsonRequest({
  required String url,
  required String method,
}) async {
  var dioClient = await DioJsonClient.getInstance();
  return dioClient.request(url, options: Options(method: method));
}

Future<Response<BlobResp>> createBlobRequest({
  required String url,
  required String method,
  String contentType = 'application/json',
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? data,
}) async {
  var dioClient = await DioBlobClient.getInstance();
  return dioClient.request(url,
      options: Options(method: method, contentType: contentType),
      queryParameters: queryParameters,
      data: data);
}

Future<Response<BlobResp>> createNoParamsBlobRequest({
  required String url,
  required String method,
}) async {
  var dioClient = await DioBlobClient.getInstance();
  return dioClient.request(url, options: Options(method: method));
}

Future<Response> createMultipartRequest({
  required String url,
  required String method,
  Map<String, dynamic>? queryParameters,
  Map<String, MultipartFile>? data,
}) async {
  var dioClient = await DioJsonClient.getInstance();
  return dioClient.request(url,
      options: Options(method: method, contentType: 'multipart/form-data'),
      queryParameters: queryParameters,
      data: FormData.fromMap(data ?? {}));
}
