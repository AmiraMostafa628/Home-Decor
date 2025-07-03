import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_section/best_seller_item.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_section/best_seller_loading_section.dart';
import 'package:lottie/lottie.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.bestSellerStatus != current.bestSellerStatus||
        previous.bestSeller != current.bestSeller ||
        previous.bestSellerErrorMessage != current.bestSellerErrorMessage,
      builder: (context, state) {
        final data = state.bestSeller?.data ?? [];
        switch(state.bestSellerStatus) {
          case RequestState.initial:
            return Container();
          case RequestState.loading:
            return BestSellerLoadingSection();
          case RequestState.loaded:
            return SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return BestSellerItem(bestSeller: data[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 20.0,
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
                    state.bestSellerErrorMessage,
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
