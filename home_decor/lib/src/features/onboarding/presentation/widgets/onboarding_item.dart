import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/components/simple_text_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/local_storage/cache_services.dart';
import 'package:home_decor/src/core/services/local_storage/cached_keys.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'package:home_decor/src/features/onboarding/domain/entities/onboarding.dart';
import 'package:home_decor/src/core/components/scroll_indicator.dart';

class BuildOnBoardingItem extends StatelessWidget {
  const BuildOnBoardingItem({
    super.key,
    required this.item,
    required this.boardController,
    required this.itemLength,
    required this.isLast,
    required this.currentIndex,
  });

  final Onboarding item;
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
                  item.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              PositionedDirectional(
                top: 5,
                start: 10,
                child: SimpleTextButton(
                  onPressed: () {
                    CacheServices.saveCachedData(key: CachedKeys.onBoardingKey, value: true);
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  foregroundColor: ColorManager.blackColor,
                  child: Row(
                    spacing: 1,
                    children: [
                      Text(
                        context.l10n.skip,
                        textScaler: TextScaler.linear(1.0),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            item.title,
            textScaler: TextScaler.linear(1.0),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorManager.primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              item.details,
              textScaler: TextScaler.linear(1.0),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
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
                  text: context.l10n.next,
                  onPressed: () {
                    if (!isLast) {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.decelerate,
                      );
                    } else {
                      CacheServices.saveCachedData(key: CachedKeys.onBoardingKey, value: true);
                      GoRouter.of(context).push(AppRouter.kLoginView);
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
