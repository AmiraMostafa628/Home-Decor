import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/custom_text_form_field.dart';
import 'package:home_decor/src/core/components/simple_text_button.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                    AppLocalizations.of(context).createAccount,
                    textScaler: TextScaler.linear(1.0),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
          Text(
            AppLocalizations.of(context).username,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text: AppLocalizations.of(context).username,
            textEditingController: userNameController,
          ),
          const SizedBox(
            height: 20.0,
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
            height: 20.0,
          ),
          Text(
            AppLocalizations.of(context).mobileNumber,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text:   AppLocalizations.of(context).mobileNumberValue,
            textEditingController: mobileController,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            AppLocalizations.of(context).dateOFBirth,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text: AppLocalizations.of(context).dateOFBirthValue,
            textEditingController: dateController,
          ),
          const SizedBox(
            height: 20.0,
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
            text:AppLocalizations.of(context).passwordValue,
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: ColorManager.hintTextColor,
            ),
            textEditingController: passwordController,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            AppLocalizations.of(context).confirmPassword,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            text:AppLocalizations.of(context).passwordValue,
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: ColorManager.hintTextColor,
            ),
            textEditingController: confirmPasswordController,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 240,
              child: RichText(
                textScaler: TextScaler.linear(1.0),
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:AppLocalizations.of(context).licences,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text:AppLocalizations.of(context).termsOfUse,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:AppLocalizations.of(context).and,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(
                      text:AppLocalizations.of(context).privacyPolicy,
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
          Center(
            child: SizedBox(
              width: 220,
              child: CustomTextButton(
                upperCase: false,
                text:AppLocalizations.of(context).signUp,
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
                AppLocalizations.of(context).orMethod,
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
                AppLocalizations.of(context).haveAccount,
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
                  AppLocalizations.of(context).loginTitle,
                  textScaler: TextScaler.linear(1.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
