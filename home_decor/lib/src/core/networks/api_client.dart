import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
          },
          baseUrl: ApiConstants.baseUrl,
        ),
      ) {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response;
    } on DioException catch (e) {
      log('Dio Error ${e.message}');
      rethrow;
    }
  }

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final dataFiltering = {
        ...?data,
      }..removeWhere((key, value) =>
      value == null || (value is String && value.toString().trim().isEmpty));

      final response = await _dio.post(
        path,
        data: dataFiltering,
        queryParameters: query,
      );
      return response;
    } on DioException catch (e) {
      log('Dio Error ${e.message}');
      rethrow;
    }
  }
}
