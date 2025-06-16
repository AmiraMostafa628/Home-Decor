import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/custom_text_form_field.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';

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
                          AppLocalizations.of(context).forgetPassword,
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
                  AppLocalizations.of(context).resetPassword,
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
                        Text(
                          AppLocalizations.of(context).enterEmail,
                          textScaler: TextScaler.linear(1.0),
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomTextFormField(
                          text: AppLocalizations.of(context).emailAddress,
                          filledColor: Colors.white,
                          textEditingController: emailController,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: SizedBox(
                            width: 220,
                            child: CustomTextButton(
                              upperCase: false,
                              onPressed: (){
                                GoRouter.of(context).push(AppRouter.kSetPasswordView);
                              },
                              text: AppLocalizations.of(context).next,
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
