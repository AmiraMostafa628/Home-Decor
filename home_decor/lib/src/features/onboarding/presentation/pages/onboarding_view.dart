import 'package:flutter/material.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/core/services/local_storage/cache_start_widget.dart';
import 'package:home_decor/src/features/onboarding/domain/entities/onboarding.dart';
import 'package:home_decor/src/features/onboarding/presentation/widgets/onboarding_item.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final boardController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Onboarding> items = [
      Onboarding(
        image: AssetsManager.onboarding1,
        title: AppLocalizations.of(context).onboardingOneTitle,
        details: AppLocalizations.of(context).onboardingOneDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding2,
        title: AppLocalizations.of(context).onboardingTwoTitle,
        details: AppLocalizations.of(context).onboardingTwoDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding3,
        title: AppLocalizations.of(context).onboardingThreeTitle,
        details: AppLocalizations.of(context).onboardingThreeDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding4,
        title: AppLocalizations.of(context).onboardingFourTitle,
        details: AppLocalizations.of(context).onboardingFourDescription,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: boardController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (value){
            if(value == items.length -1){
              CacheStartWidget.saveOnboarding();
            }
          },
          itemBuilder: (context, index) {
            return BuildOnBoardingItem(
              item: items[index],
              boardController: boardController,
              itemLength: items.length,
              isLast: index == items.length,
              currentIndex: index,
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
