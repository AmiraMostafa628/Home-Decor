import 'package:flutter/material.dart';
import 'package:home_decor/src/features/home/domain/entities/data.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_section/best_seller_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerLoadingSection extends StatelessWidget {
  const BestSellerLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 170,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return BestSellerItem(
              bestSeller: DataEntity(
                name: 'n$index',
                description: 'd$index',
                price: index,
                isSale: false,
                salePrice: 0.0,
                image: 'i$index',
                rate: 0.0,
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20.0,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
