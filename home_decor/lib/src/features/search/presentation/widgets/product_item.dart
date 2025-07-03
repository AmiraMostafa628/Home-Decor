import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/custom_image.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_items_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final SearchItemsEntity product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.lightPrimaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        spacing: 4.0,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20.0),
            child: CustomImage(
              imageType: ImagesType.network,
              height: 120,
              width: double.infinity,
              boxFit: BoxFit.cover,
              imagePath: '${ApiConstants.baseUrl}${product.image}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                Text(
                  product.name,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${product.price.toString()}',
                      style: textTheme.bodyMedium!.copyWith(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
