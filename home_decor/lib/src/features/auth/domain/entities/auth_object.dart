import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/auth/domain/entities/user_data_object.dart';

class AuthObject extends Equatable{
  final UserDataObject user;
  final String accessToken;
  final String refreshToken;

  const AuthObject({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
});

  @override
  List<Object?> get props => [
    user,
    accessToken,
    refreshToken,
  ];

}