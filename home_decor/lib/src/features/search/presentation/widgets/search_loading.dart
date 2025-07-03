import 'package:flutter/material.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_items_entity.dart';
import 'package:home_decor/src/features/search/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      childAspectRatio: .75,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(4, (index) {
        return Skeletonizer(
          enabled: true,
          child: ProductItem(
            product: SearchItemsEntity(
              id: 00,
              subCategoryId: '00',
              color: 'cc',
              name: 'nnnnn',
              description: 'dddd',
              price: 000,
              isSale: false,
              salePrice: 000,
              image: 'i$index',
              rate: 0.0,
            ),
          ),
        );
      }),
    );
  }
}
