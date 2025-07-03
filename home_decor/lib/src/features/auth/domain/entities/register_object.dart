import 'package:equatable/equatable.dart';

class RegisterObject extends Equatable {
  final String fullName;
  final String userName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final String password;
  final String confirmPassword;

  const RegisterObject({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
    fullName,
    userName,
    email,
    mobileNumber,
    dateOfBirth,
    password,
    confirmPassword,
  ];
}
