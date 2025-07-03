import 'package:flutter/material.dart';
import 'package:home_decor/src/features/home/domain/entities/data.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_section/new_collection_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewCollectionsLoadingSection extends StatelessWidget {
  const NewCollectionsLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Skeletonizer(
              enabled: true,
              child: NewCollectionItem(
              newCollections:  DataEntity(
              name: 'nn$index',
              description: 'dddddd$index',
              price: index,
              salePrice: 0.0,
              isSale: false,
              image: 'i$index',
              rate: 0.0,
                        ),
                      ),
            ),
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: .8,
      ),
    );
  }
}
