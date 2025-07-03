import 'package:dio/dio.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/auth/data/data_sources/base_remote_data_source/base_login_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/models/auth_response_error_model.dart';
import 'package:home_decor/src/features/auth/data/models/login_response_model.dart';
import 'package:home_decor/src/features/auth/data/models/login_model.dart';

class LoginRemoteDataSourceImpl extends BaseLoginRemoteDataSource {
  final ApiClient apiClient;

  LoginRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<LoginResponseModel> login({required LoginModel loginModel}) async {
    try {
      final response = await apiClient.postData(
        path: ApiConstants.login,
        data: loginModel.toJson(),
      );
      return LoginResponseModel.fromJson(response.data);
    }on DioException catch (e) {
    final data = AuthResponseErrorModel.fromJson(e.response?.data);
    final errorMessage = data.error.userName ?? data.error.password ??
    'unexpected Error please try again late ';
      throw ServerFailure(message: errorMessage);
    }
  }
}
