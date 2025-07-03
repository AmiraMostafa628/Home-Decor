import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_section/best_seller_section.dart';
import 'package:home_decor/src/features/home/presentation/widgets/slider_section/carousel_slider_widget.dart';
import 'package:home_decor/src/features/home/presentation/widgets/categories_section/categories_section.dart';
import 'package:home_decor/src/features/home/presentation/widgets/home_app_bar/home_app_bar.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_section/new_collection_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(20.0),
          sliver: SliverToBoxAdapter(
            child: HomeAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: CarouselSliderWidget(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Categories',
              style: textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20.0),
          sliver: SliverToBoxAdapter(
            child: CategoriesSection(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Best Seller',
              style: textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 55,
            bottom: 20.0,
          ),
          sliver: SliverToBoxAdapter(
            child: BestSellerSection(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New Collection',
              style: textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          sliver: NewCollectionSection(),
        ),
      ],
    );
  }
}
