import 'package:equatable/equatable.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';

class HomeState extends Equatable {
  final int selectedBottomNavbarIndex;
  final RequestState sliderStatus;
  final String sliderErrorMessage;
  final SliderEntity? slider;
  final RequestState categoriesStatus;
  final String categoriesErrorMessage;
  final CategoriesEntity? categories;
  final RequestState bestSellerStatus;
  final String bestSellerErrorMessage;
  final NewCollectionsAndBestSellerEntity? bestSeller;
  final RequestState newCollectionsStatus;
  final String newCollectionsErrorMessage;
  final NewCollectionsAndBestSellerEntity? newCollections;

  const HomeState({
    this.selectedBottomNavbarIndex = 0,
    this.sliderStatus = RequestState.initial,
    this.sliderErrorMessage = '',
    this.slider,
    this.categoriesStatus = RequestState.initial,
    this.categoriesErrorMessage = '',
    this.categories,
    this.bestSellerStatus = RequestState.initial,
    this.bestSellerErrorMessage = '',
    this.bestSeller,
    this.newCollectionsStatus = RequestState.initial,
    this.newCollectionsErrorMessage = '',
    this.newCollections,
  });

  HomeState copyWith({
    int? selectedBottomNavbarIndex,
    RequestState? sliderStatus,
    String? sliderErrorMessage,
    SliderEntity? slider,
    RequestState? categoriesStatus,
    String? categoriesErrorMessage,
    CategoriesEntity? categories,
    RequestState? bestSellerStatus,
    String? bestSellerErrorMessage,
    NewCollectionsAndBestSellerEntity? bestSeller,
    RequestState? newCollectionsStatus,
    String? newCollectionsErrorMessage,
    NewCollectionsAndBestSellerEntity? newCollections,
  }) {
    return HomeState(
      selectedBottomNavbarIndex:
          selectedBottomNavbarIndex ?? this.selectedBottomNavbarIndex,
      sliderStatus: sliderStatus ?? this.sliderStatus,
      sliderErrorMessage: sliderErrorMessage ?? this.sliderErrorMessage,
      slider: slider ?? this.slider,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categoriesErrorMessage: categoriesErrorMessage ?? this.sliderErrorMessage,
      categories: categories ?? this.categories,
      bestSellerStatus: bestSellerStatus ?? this.bestSellerStatus,
      bestSellerErrorMessage:
          bestSellerErrorMessage ?? this.bestSellerErrorMessage,
      bestSeller: bestSeller ?? this.bestSeller,
      newCollectionsStatus: newCollectionsStatus ?? this.newCollectionsStatus,
      newCollectionsErrorMessage:
          newCollectionsErrorMessage ?? this.bestSellerErrorMessage,
      newCollections: newCollections ?? this.newCollections,
    );
  }



  @override
  List<Object?> get props => [
    selectedBottomNavbarIndex,
    selectedBottomNavbarIndex,
    sliderStatus,
    sliderErrorMessage,
    slider,
    categoriesStatus,
    categoriesErrorMessage,
    categories,
    bestSellerStatus,
    bestSellerErrorMessage,
    bestSeller,
    newCollectionsStatus,
    newCollectionsErrorMessage,
    newCollections,
  ];
}
