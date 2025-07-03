import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';

abstract class AuthEvent extends Equatable {}

class PickDateEvent extends AuthEvent {
  final BuildContext context;

  PickDateEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [
    context,
  ];
}

class LoginEvent extends AuthEvent {
  final LoginObject loginObject;

  LoginEvent({
    required this.loginObject,
  });

  @override
  List<Object?> get props => [
    loginObject,
  ];
}

class RegisterEvent extends AuthEvent {
  final RegisterObject registerObject;

  RegisterEvent({
    required this.registerObject,
  });

  @override
  List<Object?> get props => [
    registerObject,
  ];
}

class LoginPasswordVisibilityEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class RegisterPasswordVisibilityEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class RegisterConfirmPasswordVisibilityEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
