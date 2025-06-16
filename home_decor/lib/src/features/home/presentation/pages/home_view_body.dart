import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/home_custom_scroll_view.dart';
import 'package:lottie/lottie.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.overallStatus) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return HomeCustomScrollView();
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
                    '${state.sliderErrorMessage} ${state.categoriesStatus} ${state.newCollectionsErrorMessage} ${state.bestSellerStatus}',
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
