import 'package:home_decor/src/features/auth/data/models/user_data_model.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';

class LoginResponseModel extends AuthObject {
  const LoginResponseModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: UserDataModel.fromJson(json['user']),
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }
}

