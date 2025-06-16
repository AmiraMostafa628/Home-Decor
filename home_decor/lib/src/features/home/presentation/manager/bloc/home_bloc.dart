import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/best_seller_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/categories_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/new_collection_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/slider_use_case.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_event.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  final SliderUseCase sliderUseCase;
  final CategoriesUseCase categoriesUseCase;
  final BestSellerUseCase bestSellerUseCase;
  final NewCollectionUseCase newCollectionUseCase;

  HomeBloc(
    this.sliderUseCase,
    this.categoriesUseCase,
    this.bestSellerUseCase,
    this.newCollectionUseCase,
  ) : super(HomeState()) {
    on<ChangeHomeNavigationBar>(_changeNavBarIndex);
    on<SliderEvent>(_sliderData);
    on<CategoriesEvent>(_categoriesData);
    on<BestSellerEvent>(_bestSellerData);
    on<NewCollectionEvent>(_newCollectionsData);
  }

  FutureOr<void> _changeNavBarIndex(
    ChangeHomeNavigationBar event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        selectedBottomNavbarIndex: event.selectedBottomNavbarIndex,
      ),
    );
  }

  Future<void> _sliderData(
    SliderEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await sliderUseCase.call(NoParam());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            sliderStatus: RequestState.error,
            sliderErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            slider: data,
            sliderStatus: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _categoriesData(
    CategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await categoriesUseCase.call(NoParam());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            categoriesStatus: RequestState.error,
            categoriesErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            categories: data,
            categoriesStatus: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _bestSellerData(
    BestSellerEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await bestSellerUseCase.call(NoParam());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            bestSellerStatus: RequestState.error,
            bestSellerErrorMessage: failure.message,
          ),
        );
      },
      (data) {

        emit(
          state.copyWith(
            bestSellerStatus: RequestState.loaded,
            bestSeller: data,
          ),
        );
      },
    );
  }

  Future<void> _newCollectionsData(
    NewCollectionEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await newCollectionUseCase.call(NoParam());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            newCollectionsStatus: RequestState.error,
            newCollectionsErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            newCollectionsStatus: RequestState.loaded,
            newCollections: data,
          ),
        );
      },
    );
  }
}
