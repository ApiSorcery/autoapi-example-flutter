import 'package:dio/dio.dart';
import '/utils/config.dart';
import '../interceptors/response.dart';
import '../interceptors/request.dart';

// API wrapper
class DioBlobClient {
  static Dio? _dio;
  // Basic settings
  static BaseOptions options = BaseOptions(
      baseUrl: Config.apiHost,
      responseType: ResponseType.bytes,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 10),
      followRedirects: true);

  static Future<Dio> getInstance() async {
    if (_dio == null) {
      _dio = Dio(options);
      _dio!.interceptors.add(RequestInterceptor());
      _dio!.interceptors.add(ResponseInterceptor());
    }
    return _dio!;
  }
}
