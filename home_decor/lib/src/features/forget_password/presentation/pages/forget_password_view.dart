import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/core/components/adaptive_input_field.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'package:home_decor/src/core/services/validation/user_name_validation_service.dart';

class ForgetPasswordView extends StatelessWidget {
   ForgetPasswordView({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Row(
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
                         context.l10n.forgetPassword,
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
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                 context.l10n.resetPassword,
                  textScaler: TextScaler.linear(1.0),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor.withAlpha(70),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        AdaptiveInputField(
                          context: context,
                          fillColor: ColorManager.whiteColor,
                          title: context.l10n.enterEmail,
                          hintText: context.l10n.emailAddress,
                          controller: emailController,
                          heightAfterIt: 30.0,

                          validate: (value) {
                            return isUserNameValid(userName: value);
                          },
                        ),
                        Center(
                          child: SizedBox(
                            width: 220,
                            child: CustomTextButton(
                              upperCase: false,
                              onPressed: (){
                                GoRouter.of(context).push(AppRouter.kSetPasswordView);
                              },
                              text:context.l10n.next,
                            ),
                          ),
                        ),

                      ],
                    ),
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
