import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create spaces that bring joy',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(Icons.search,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
