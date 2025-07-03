import 'package:equatable/equatable.dart';

class UserDataObject extends Equatable {
  final String username;
  final String email;

  const UserDataObject({
    required this.username,
    required this.email,
  });

  @override
  List<Object?> get props => [
    username,
    email,
  ];
}
