import 'package:dio/dio.dart';
import 'package:navigation/Rset_Const/const.dart';

class RestClient {
  static final _instance = RestClient._internal();

  Dio _dio;

  RestClient._internal() {
    _dio = Dio(BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      sendTimeout: 20000,
      baseUrl: RestConsts.COVID,
    ));

    _dio.options.contentType = Headers.formUrlEncodedContentType;

    _dio.interceptors.addAll([
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  factory RestClient() {
    return _instance;
  }

  Dio dio() => _dio..options.contentType = Headers.formUrlEncodedContentType;

  Dio dioByContentType(String contentType) =>
      _dio..options.contentType = contentType;
}
