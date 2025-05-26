
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({
    super.key,
    required this.currentIndex,
    required this.itemLength
  });

  final int currentIndex;
  final int itemLength;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(itemLength, (index){
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: AnimatedContainer(
              height: 12,
              width: currentIndex == index ? 60 : 18,
              duration: const Duration(milliseconds: 700),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentIndex == index
                    ? ColorManager.primaryColor
                    : ColorManager.lightPrimaryColor,
              ),
            ),
          );
        })
    );
  }
}