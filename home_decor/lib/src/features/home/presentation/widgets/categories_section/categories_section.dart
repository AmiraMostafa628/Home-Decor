import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/categories_section/categories_item_builder.dart';
import 'package:home_decor/src/features/home/presentation/widgets/categories_section/categories_loading_section.dart';
import 'package:lottie/lottie.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.categoriesStatus != current.categoriesStatus||
          previous.categories != current.categories ||
          previous.categoriesErrorMessage != current.categoriesErrorMessage,
      builder: (context, state) {
        final data = state.categories?.data ?? [];
       switch(state.categoriesStatus) {
         case RequestState.initial:
          return Container();
         case RequestState.loading:
           return CategoriesLoadingSection();
         case RequestState.loaded:
           return SizedBox(
             height: 100,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                 return CategoriesItemBuilder(data: data[index]);
               },
               separatorBuilder: (context, index) => const SizedBox(
                 width: 10.0,
               ),
               itemCount: data.length,
             ),
           );
         case RequestState.error:
           return Center(
             child: Column(
               spacing: 10.0,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Lottie.asset(
                   AssetsManager.error,
                   width: 100,
                   height: 100,
                   fit: BoxFit.cover,
                 ),
                 Text(
                   state.categoriesErrorMessage,
                   style: Theme.of(context).textTheme.titleLarge,
                 ),
               ],
             ),
           );
          
       }
      },
    );
  }
}
