import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/onboarding/domain/entities/onboarding_model.dart';
import 'package:home_decor/src/features/onboarding/presentation/widgets/scroll_indicator.dart';

class BuildOnBoardingItem extends StatelessWidget {
  const BuildOnBoardingItem({
    super.key,
    required this.model,
    required this.boardController,
    required this.itemLength,
    required this.isLast,
    required this.currentIndex,
  });

  final OnboardingModel model;
  final PageController boardController;
  final int itemLength;
  final bool isLast;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  model.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 10,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: ColorManager.blackColor,
                  ),
                  child: Row(
                    spacing: 1,
                    children: [
                      Text('Skip'),
                      Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            model.details,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScrollIndicator(
                  currentIndex: currentIndex,
                  itemLength: itemLength,
                ),
                CustomTextButton(
                  text: 'Next',
                  onPressed: () {
                    if (!isLast) {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  width: 170,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

