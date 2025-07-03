import 'package:equatable/equatable.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';

class AuthState extends Equatable {
  final String date;
  final RequestState loginState;
  final String? loginErrorMessage;
  final AuthObject? loginData;
  final RequestState registerState;
  final String? registerErrorMessage;
  final AuthObject? registerData;
  final bool loginPasswordVisibility;
  final bool registerPasswordVisibility;
  final bool registerConfirmPasswordVisibility;

  const AuthState({
    this.date = '',
    this.loginState = RequestState.initial,
    this.loginErrorMessage,
    this.loginData,
    this.registerState = RequestState.initial,
    this.registerErrorMessage,
    this.registerData,
    this.loginPasswordVisibility = true,
    this.registerPasswordVisibility = true,
    this.registerConfirmPasswordVisibility = true,
  });

  AuthState copyWith({
    dynamic date,
    RequestState? loginState,
    dynamic loginErrorMessage,
    AuthObject? loginData,
    RequestState? registerState,
    dynamic registerErrorMessage,
    AuthObject? registerData,
    bool? loginPasswordVisibility,
    bool? registerPasswordVisibility,
    bool? registerConfirmPasswordVisibility,
  }) {
    return AuthState(
      date: date ?? this.date,
      loginState: loginState ?? this.loginState,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      loginData: loginData ?? this.loginData,
      registerState: registerState ?? this.registerState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
      registerData: registerData ?? this.registerData,
      loginPasswordVisibility:
          loginPasswordVisibility ?? this.loginPasswordVisibility,
      registerPasswordVisibility:
          registerPasswordVisibility ?? this.registerPasswordVisibility,
      registerConfirmPasswordVisibility:
          registerConfirmPasswordVisibility ??
          this.registerConfirmPasswordVisibility,
    );
  }

  @override
  List<Object?> get props => [
    date,
    loginState,
    loginErrorMessage,
    loginData,
    registerState,
    registerErrorMessage,
    registerData,
    loginPasswordVisibility,
    registerPasswordVisibility,
    registerConfirmPasswordVisibility,
  ];
}
