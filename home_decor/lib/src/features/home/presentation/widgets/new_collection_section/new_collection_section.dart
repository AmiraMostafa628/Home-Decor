import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_section/new_collection_item.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_section/new_collections_loading_section.dart';
import 'package:lottie/lottie.dart';

class NewCollectionSection extends StatelessWidget {
  const NewCollectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.newCollectionsStatus != current.newCollectionsStatus ||
          previous.newCollections != current.newCollections ||
          previous.newCollectionsErrorMessage != current.newCollectionsErrorMessage,
      builder: (context, state) {
        switch (state.newCollectionsStatus) {
          case RequestState.initial:
            return SliverToBoxAdapter(
              child: Container(),
            );
          case RequestState.loading:
            return NewCollectionsLoadingSection();
          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => NewCollectionItem(
                  newCollections: state.newCollections!.data[index],
                ),
                childCount: state.newCollections!.data.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: .8,
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: Center(
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
                      state.newCollectionsErrorMessage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
