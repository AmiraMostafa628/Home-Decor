import 'package:home_decor/src/features/auth/domain/entities/user_data_object.dart';

class UserDataModel extends UserDataObject {
  const UserDataModel({
    required super.username,
    required super.email,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      username: json['username'],
      email: json['email'],
    );
  }
}
