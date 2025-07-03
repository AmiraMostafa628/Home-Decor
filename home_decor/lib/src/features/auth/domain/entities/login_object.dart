import 'package:equatable/equatable.dart';

class LoginObject extends Equatable {
  final String userName;
  final String password;

  const LoginObject({
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [
    userName,
    password,
  ];
}
