import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/core/components/adaptive_input_field.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/simple_text_button.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'package:home_decor/src/core/services/validation/password_validation_service.dart';
import 'package:home_decor/src/core/services/validation/user_name_validation_service.dart';
import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_event.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_state.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginState == RequestState.loaded) {
          GoRouter.of(
            context,
          ).push(AppRouter.kMainView);
        }
        if (state.loginState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.primaryColor,
              duration: Duration(seconds: 3),
              content: Text(
                state.loginErrorMessage ?? '',
                style: TextTheme.of(context).bodyLarge,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    context.l10n.loginTitle,
                    textScaler: TextScaler.linear(1.0),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  context.l10n.welcome,
                  textScaler: TextScaler.linear(1.0),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  context.l10n.welcomeSubTitle,
                  textScaler: TextScaler.linear(1.0),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.userName,
                  hintText: context.l10n.userName,
                  controller: userNameController,
                  heightAfterIt: 30.0,
                  validate: (value) {
                    return isUserNameValid(userName: value);
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.password,
                  hintText: context.l10n.passwordValue,
                  controller: passwordController,
                  isPassword: state.loginPasswordVisibility,
                  suffix: Icon(
                    state.loginPasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.hintTextColor,
                  ),
                  suffixPressed: () {
                    AuthBloc.get(context).add(LoginPasswordVisibilityEvent());
                  },
                  heightAfterIt: 40.0,
                  validate: (value) {
                    return isPasswordValid(password: value);
                  },
                ),
                state.loginState == RequestState.loading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: SizedBox(
                          width: 220,
                          child: CustomTextButton(
                            upperCase: false,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthBloc.get(context).add(
                                  LoginEvent(
                                    loginObject: LoginObject(
                                      userName: userNameController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            text: context.l10n.loginButton,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: SimpleTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kForgetPasswordView,
                      );
                    },
                    foregroundColor: ColorManager.blackColor,
                    child: Text(
                      context.l10n.forgetPasswordButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
