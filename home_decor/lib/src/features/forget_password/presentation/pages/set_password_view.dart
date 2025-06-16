import 'package:flutter/material.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/custom_text_form_field.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';

class SetPasswordView extends StatelessWidget {
  SetPasswordView({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                        AppLocalizations.of(context).setPassword,
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
              SizedBox(
                height: 20.0,
              ),
              Text(
                AppLocalizations.of(context).changePassword,
                textScaler: TextScaler.linear(1.0),
                style:
                    Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                AppLocalizations.of(context).password,
                textScaler: TextScaler.linear(1.0),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 30.0,
              ),
              Text(
                AppLocalizations.of(context).confirmPassword,
                textScaler: TextScaler.linear(1.0),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                 fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextFormField(
                text: AppLocalizations.of(context).passwordValue,
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: ColorManager.hintTextColor,
                ),
                textEditingController: confirmPasswordController,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: 220,
                  child: CustomTextButton(
                    upperCase: false,
                    text: AppLocalizations.of(context).resetPassword,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
