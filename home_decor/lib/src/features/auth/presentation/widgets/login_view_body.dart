import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/custom_text_form_field.dart';
import 'package:home_decor/src/core/components/simple_text_button.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/local_storage/cache_start_widget.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context).loginTitle,
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
            AppLocalizations.of(context).welcome,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Text(
            AppLocalizations.of(context).welcomeSubTitle,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            AppLocalizations.of(context).emailAddress,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text: AppLocalizations.of(context).emailValue,
            textEditingController: emailController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            AppLocalizations.of(context).password,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text: AppLocalizations.of(context).passwordValue,
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: ColorManager.hintTextColor,
            ),
            textEditingController: passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 220,
              child: CustomTextButton(
                upperCase: false,
                onPressed: (){
                  CacheStartWidget.saveIsLogin();
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                text: AppLocalizations.of(context).loginButton,
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
                AppLocalizations.of(context).forgetPasswordButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
