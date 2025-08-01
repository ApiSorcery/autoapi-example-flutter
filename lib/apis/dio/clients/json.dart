import 'package:dio/dio.dart';
import '../../../utils/config.dart';
import '../interceptors/json_response.dart';
import '../interceptors/request.dart';

// API wrapper
class DioJsonClient {
  static Dio? _dio;
  // Basic settings
  static BaseOptions options = BaseOptions(
      baseUrl: Config.apiHost,
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
