import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/core/services/local_storage/cache_services.dart';
import 'package:home_decor/src/core/services/local_storage/cached_keys.dart';
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
        title: context.l10n.onboardingOneTitle,
        details: context.l10n.onboardingOneDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding2,
        title: context.l10n.onboardingTwoTitle,
        details: context.l10n.onboardingTwoDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding3,
        title: context.l10n.onboardingThreeTitle,
        details: context.l10n.onboardingThreeDescription,
      ),
      Onboarding(
        image: AssetsManager.onboarding4,
        title: context.l10n.onboardingFourTitle,
        details: context.l10n.onboardingFourDescription,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: boardController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (value){
            if(value == items.length -1){
              CacheServices.saveCachedData(key: CachedKeys.onBoardingKey, value: true);
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
