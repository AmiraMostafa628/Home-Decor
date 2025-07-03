import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:home_decor/src/features/auth/domain/use_cases/register_use_case.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_event.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_state.dart';
import 'package:intl/intl.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  static AuthBloc get(context) => BlocProvider.of(context);

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<PickDateEvent>(_showDatePicker);
    on<LoginPasswordVisibilityEvent>(_changeLoginPassVisibility);
    on<RegisterPasswordVisibilityEvent>(_changeRegisterPassVisibility);
    on<RegisterConfirmPasswordVisibilityEvent>(_changeRegisterConfirmPassVisibility);
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loginState: RequestState.loading,
      ),
    );
    final result = await loginUseCase.call(
      param: event.loginObject,
    );
    log('result========== $result');
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            loginErrorMessage: failure.message,
            loginState: RequestState.error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            loginData: data,
            loginState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _register(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        registerState: RequestState.loading,
      ),
    );
    final result = await registerUseCase.call(
      param: event.registerObject,
    );

    result.fold(
      (failure) {

        emit(

          state.copyWith(
            registerErrorMessage: failure.message,
            registerState: RequestState.error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            registerData: data,
            registerState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _showDatePicker(
    PickDateEvent event,
    Emitter<AuthState> emit,
  ) async {
    late String formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
      context: event.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    emit(
      state.copyWith(date: formattedDate),
    );
  }

  bool loginPassVisible = true;

  FutureOr<void> _changeLoginPassVisibility(
    LoginPasswordVisibilityEvent event,
    Emitter<AuthState> emit,
  ) {
    loginPassVisible = !loginPassVisible;
    emit(state.copyWith(
      loginPasswordVisibility: loginPassVisible
    ));

  }

  bool registerPassVisible = true;

  FutureOr<void> _changeRegisterPassVisibility(
      RegisterPasswordVisibilityEvent event,
      Emitter<AuthState> emit,
      ) {
    registerPassVisible = !registerPassVisible;
    emit(state.copyWith(
        registerPasswordVisibility: registerPassVisible
    ));

  }

  bool registerConfirmPassVisible = true;

  FutureOr<void> _changeRegisterConfirmPassVisibility(
      RegisterConfirmPasswordVisibilityEvent event,
      Emitter<AuthState> emit,
      ) {
    registerConfirmPassVisible = !registerConfirmPassVisible;
    emit(state.copyWith(
        registerConfirmPasswordVisibility: registerConfirmPassVisible,
    ));

  }
}
