import 'package:flutter/material.dart';
import 'package:home_decor/src/features/home/domain/entities/categories_data.dart';
import 'package:home_decor/src/features/home/presentation/widgets/categories_section/categories_item_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesLoadingSection extends StatelessWidget {
  const CategoriesLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesItemBuilder(
              data: CategoriesData(
                id: index,
                name: 'ttt$index',
                icon: 'iii$index',
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10.0,
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
