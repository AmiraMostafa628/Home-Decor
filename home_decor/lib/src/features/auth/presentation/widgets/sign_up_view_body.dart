import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/core/components/adaptive_input_field.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/simple_text_button.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'package:home_decor/src/core/services/validation/confirm_password_validation_service.dart';
import 'package:home_decor/src/core/services/validation/date_of_birth_validation_service.dart';
import 'package:home_decor/src/core/services/validation/email_validation_service.dart';
import 'package:home_decor/src/core/services/validation/mobile_number_validation_service.dart';
import 'package:home_decor/src/core/services/validation/password_validation_service.dart';
import 'package:home_decor/src/core/services/validation/user_name_validation_service.dart';
import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_event.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_state.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.date.isNotEmpty) {
          dateController.text = state.date;
          formKey.currentState!.validate();
        }
        if (state.registerState == RequestState.loaded) {
          GoRouter.of(
            context,
          ).push(AppRouter.kMainView);
        }

        if (state.registerState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.primaryColor,
              duration: Duration(seconds: 3),
              content: Text(
                state.registerErrorMessage ?? '',
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          context.l10n.createAccount,
                          textScaler: TextScaler.linear(1.0),
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primaryColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.fullName,
                  hintText: context.l10n.fullName,
                  controller: fullNameController,
                  heightAfterIt: 20.0,
                  validate: (value) {
                    return isUserNameValid(userName: value);
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.userName,
                  hintText: context.l10n.userName,
                  controller: userNameController,
                  heightAfterIt: 20.0,
                  validate: (value) {
                    return isUserNameValid(userName: value);
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.emailAddress,
                  hintText: context.l10n.emailValue,
                  controller: emailController,
                  heightAfterIt: 20.0,
                  validate: (value) {
                    return isEmailValid(email: value);
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.mobileNumber,
                  hintText: context.l10n.mobileNumberValue,
                  controller: mobileController,
                  heightAfterIt: 20.0,
                  validate: (value) {
                    return isMobileNumberValid(
                      mobileNumber: value,
                    );
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  readOnly: true,
                  onTap: () {
                    AuthBloc.get(context).add(PickDateEvent(context: context));
                  },
                  title: context.l10n.dateOFBirth,
                  hintText: context.l10n.dateOFBirthValue,
                  controller: dateController,
                  heightAfterIt: 20.0,
                  validate: (value) {
                    return dateOfBirthValid(
                      dateOfBirth: value,
                    );
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.password,
                  hintText: context.l10n.passwordValue,
                  controller: passwordController,
                  heightAfterIt: 20.0,
                  isPassword: state.registerPasswordVisibility,
                  suffix: Icon(
                    state.registerPasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.hintTextColor,
                  ),
                  suffixPressed: () {
                    AuthBloc.get(
                      context,
                    ).add(RegisterPasswordVisibilityEvent());
                  },
                  validate: (value) {
                    return isPasswordValid(password: value);
                  },
                ),
                AdaptiveInputField(
                  context: context,
                  title: context.l10n.confirmPassword,
                  hintText: context.l10n.passwordValue,
                  controller: confirmPasswordController,
                  heightAfterIt: 20.0,
                  isPassword: state.registerConfirmPasswordVisibility,
                  suffix: Icon(
                    state.registerConfirmPasswordVisibility
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorManager.hintTextColor,
                  ),
                  suffixPressed: () {
                    AuthBloc.get(
                      context,
                    ).add(RegisterConfirmPasswordVisibilityEvent());
                  },
                  validate: (value) {
                    return matchPassword(
                      value: value,
                      password: passwordController.text,
                    );
                  },
                ),
                Center(
                  child: SizedBox(
                    width: 240,
                    child: RichText(
                      textScaler: TextScaler.linear(1.0),
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: context.l10n.licences,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: context.l10n.termsOfUse,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: context.l10n.and,
                            style: TextStyle(
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          TextSpan(
                            text: context.l10n.privacyPolicy,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                state.registerState == RequestState.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: SizedBox(
                          width: 220,
                          child: CustomTextButton(
                            upperCase: false,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthBloc.get(context).add(
                                  RegisterEvent(
                                    registerObject: RegisterObject(
                                      fullName: fullNameController.text,
                                      userName: userNameController.text,
                                      email: emailController.text,
                                      mobileNumber: mobileController.text,
                                      dateOfBirth: dateController.text,
                                      password: passwordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            text: context.l10n.signUp,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      context.l10n.orMethod,
                      textScaler: TextScaler.linear(1.0),
                    ),
                  ),
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.facebookIcon,
                    ),
                    Image.asset(
                      AssetsManager.googleIcon,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.haveAccount,
                      textScaler: TextScaler.linear(1.0),
                    ),
                    SimpleTextButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.kLoginView,
                        );
                      },
                      foregroundColor: ColorManager.darkPrimaryColor,
                      child: Text(
                        context.l10n.loginTitle,
                        textScaler: TextScaler.linear(1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
