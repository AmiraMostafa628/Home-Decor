import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/adaptive_input_field.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/validation/confirm_password_validation_service.dart';
import 'package:home_decor/src/core/services/validation/password_validation_service.dart';

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
                        context.l10n.setPassword,
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
                context.l10n.changePassword,
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
              AdaptiveInputField(
                context: context,
                title: context.l10n.password,
                hintText: context.l10n.passwordValue,
                controller: passwordController,
                heightAfterIt: 30.0,
                suffix: Icon(
                  Icons.visibility_off_outlined,
                  color: ColorManager.hintTextColor,
                ),
                validate: (value) {
                  return isPasswordValid(password: value);
                },
              ),
              AdaptiveInputField(
                context: context,
                title: context.l10n.confirmPassword,
                hintText: context.l10n.passwordValue,
                controller: confirmPasswordController,
                heightAfterIt: 40.0,
                suffix: Icon(
                  Icons.visibility_off_outlined,
                  color: ColorManager.hintTextColor,
                ),
                validate: (value) {
                  return matchPassword(
                    value: value,
                    password: passwordController.text,
                  );
                },
              ),
              Center(
                child: SizedBox(
                  width: 220,
                  child: CustomTextButton(
                    upperCase: false,
                    text: context.l10n.resetPassword,
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
