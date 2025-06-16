import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final data = state.categories!.data;
        return SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                spacing: 10.0,
                children: [
                  Container(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.lightPrimaryColor,
                    ),

                    child: CachedNetworkImage(
                      imageUrl: data[index].icon,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  Text(
                    data[index].name,
                    style: textTheme.bodySmall!.copyWith(),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            itemCount: data.length,
          ),
        );
      },
    );
  }
}
