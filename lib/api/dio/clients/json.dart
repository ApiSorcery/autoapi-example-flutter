import 'package:dio/dio.dart';
import '../interceptors/json_response.dart';
import '../interceptors/request.dart';

// api封装
class DioJsonClient {
  static Dio? _dio;
  // 基本设置
  static BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:9002',
      responseType: ResponseType.json,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 5),
      followRedirects: true);

  static Future<Dio> getInstance() async {
    if (_dio == null) {
      _dio = Dio(options);
      _dio!.interceptors.add(RequestInterceptor());
      _dio!.interceptors.add(JsonResponseInterceptor());
    }
    return _dio!;
  }
}
