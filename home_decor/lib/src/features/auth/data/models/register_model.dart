import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';

class RegisterModel extends RegisterObject {
  const RegisterModel({
    required super.fullName,
    required super.userName,
    required super.email,
    required super.mobileNumber,
    required super.dateOfBirth,
    required super.password,
    required super.confirmPassword,
  });

  factory RegisterModel.fromObject(RegisterObject object) {
    return RegisterModel(
      fullName: object.fullName,
      email: object.email,
      userName: object.userName,
      mobileNumber: object.mobileNumber,
      dateOfBirth: object.dateOfBirth,
      password: object.password,
      confirmPassword: object.confirmPassword,
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'username': userName,
    'mobile_number': mobileNumber,
    'date_of_birth': dateOfBirth,
    'password': password,
    'confirm_password': confirmPassword,
  };
}
