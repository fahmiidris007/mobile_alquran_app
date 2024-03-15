import 'package:dio/dio.dart';
import 'package:mobile_alquran_app/common/constants/paths.dart';

class ApiClient {
  ApiClient._();

  static final instance = ApiClient._();

  factory ApiClient() => instance;

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Paths.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json),
  );

  //GET list
  Future<List<dynamic>> getList(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "network error, please try again";
    } catch (e) {
      rethrow;
    }
  }


  //GET detail
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "network error, please try again";
    } catch (e) {
      rethrow;
    }
  }
}
