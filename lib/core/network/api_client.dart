import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../error/exceptions.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 可以在这里添加 token 等认证信息
          // final token = getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response != null) {
            throw ServerException(
              error.response?.data['message'] ?? '服务器错误',
            );
          } else if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout) {
            throw NetworkException('连接超时，请检查网络');
          } else {
            throw NetworkException('网络错误');
          }
        },
      ),
    );
  }

  Dio get dio => _dio;
}

