import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class FetchSearchDataEvent extends SearchEvent {
  final SearchParamsEntity searchParamEntity;

  const FetchSearchDataEvent({
    required this.searchParamEntity,
  });

  @override
  List<Object?> get props => [
    searchParamEntity,
  ];
}

class FetchApiSettingEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchQueryEvent extends SearchEvent {
  final String searchQuery;

  const SearchQueryEvent({required this.searchQuery});

  @override
  List<Object?> get props => [
    searchQuery,
  ];
}

class ChangePriceValueEvent extends SearchEvent {
  final double priceValue;

  const ChangePriceValueEvent({required this.priceValue});

  @override
  List<Object?> get props => [
    priceValue,
  ];
}

class SelectSubCategoryEvent extends SearchEvent {
  final int selectedSubCategoryId;
  final int selectedSubCategoryIndex;

  const SelectSubCategoryEvent({
    required this.selectedSubCategoryId,
    required this.selectedSubCategoryIndex,
  });

  @override
  List<Object?> get props => [
    selectedSubCategoryId,
    selectedSubCategoryIndex,
  ];
}

class SelectColorEvent extends SearchEvent {
  final int selectedColorId;
  final int selectedColorIndex;

  const SelectColorEvent({
    required this.selectedColorId,
    required this.selectedColorIndex,
  });

  @override
  List<Object?> get props => [
    selectedColorId,
    selectedColorIndex,
  ];
}
