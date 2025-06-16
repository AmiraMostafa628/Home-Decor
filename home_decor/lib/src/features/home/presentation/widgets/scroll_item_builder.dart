import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/scroll_indicator.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/domain/entities/slider_data.dart';

class ScrollItemBuilder extends StatelessWidget {
  const ScrollItemBuilder({
    super.key,
    required this.itemLength,
    required this.item,
    required this.currentIndex,
  });

  final SliderData item;
  final int itemLength;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: ColorManager.primaryColor,
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                item.image,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),

        ScrollIndicator(
          mainAxisAlignment: MainAxisAlignment.center,
          currentIndex: currentIndex,
          itemLength: itemLength,
          unActiveWidth:50.0,
          activeWidth: 50,
          height: 8,
        ),
      ],
    );
  }
}
