import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:home_decor/src/core/networks/api_constance.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() :_dio = Dio(
    BaseOptions(
      baseUrl: ApiConstance.baseUrl
    )
  );

  Future<Response> getDate({
    required String path,
    Map<String,dynamic>? query
}) async{
    try{
      final response = await _dio.get(path,queryParameters: query);
      return response;
    } on DioException catch(e){
      log('Dio Error ${e.message}');
      rethrow;
    }

  }
}