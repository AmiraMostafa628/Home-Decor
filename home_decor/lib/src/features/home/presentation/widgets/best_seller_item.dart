import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/domain/entities/data.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bestSeller});

  final DataEntity bestSeller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 170,
          width: MediaQuery.of(context).size.width - 40.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.0,
            children: [
              Text(
                bestSeller.name,
                style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                width: 220.0,
                child: Text(
                  bestSeller.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 70.0,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    child: Row(
                      spacing: 4.0,
                      children: [
                        Icon(Icons.star,
                          color: ColorManager.primaryColor,
                        ),
                        Text(
                          bestSeller.rate.toString(),
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    child: Text(
                      'Shop Now',
                      style: textTheme.bodyMedium,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -50,
          right: 10,
          child: Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  bestSeller.image,
                ),
                fit: BoxFit.cover,
              ),
            ),

          ),
        ),
      ],
    );
  }
}
