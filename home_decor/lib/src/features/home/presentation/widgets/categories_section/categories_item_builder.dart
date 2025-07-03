import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/custom_image.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/domain/entities/categories_data.dart';

class CategoriesItemBuilder extends StatelessWidget {
  const CategoriesItemBuilder({super.key, required this.data});

  final CategoriesData data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 10.0,
      children: [
        Container(
          padding: EdgeInsets.all(18),
          height: 70,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorManager.lightPrimaryColor,
          ),
         child: CustomImage(
           width: 20,
           height: 20,
           imageType: ImagesType.network,
           imagePath: data.icon,
           color: ColorManager.primaryColor,
         ),
        
        ),
        Text(
          data.name,
          style: textTheme.bodySmall!.copyWith(),
        ),
      ],
    );
  }
}
