import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/features/onboarding/domain/entities/onboarding_model.dart';
import 'package:home_decor/src/features/onboarding/presentation/widgets/onboarding_item.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final boardController = PageController();

  final List<OnboardingModel> items = [
    OnboardingModel(
      image: AssetsManager.onboarding1,
      title: 'Comfortable Space',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding2,
      title: 'Modern Design',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding3,
      title: 'Styled Living',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding4,
      title: 'Relaxing Furniture',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: boardController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return BuildOnBoardingItem(
              model: items[index],
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
