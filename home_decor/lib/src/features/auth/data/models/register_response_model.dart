import 'package:home_decor/src/features/auth/data/models/user_data_model.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';

class RegisterResponseModel extends AuthObject {
  const RegisterResponseModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      user: UserDataModel.fromJson(json['user']),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}