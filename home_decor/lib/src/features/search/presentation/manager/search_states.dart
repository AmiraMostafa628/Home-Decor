import 'package:equatable/equatable.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/api_setting_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_entity.dart';

class SearchState extends Equatable {
  final RequestState searchStatus;
  final SearchEntity? searchEntity;
  final String searchErrorMessage;
  final RequestState apiSettingStatus;
  final ApiSettingEntity? apiSettingEntity;
  final String apiSettingErrorMessage;
  final double priceValue;
  final int? selectedSubCategoriesIndex;
  final int? selectedSubCategoriesId;
  final int? selectedColorIndex;
  final int? selectedColorId;
  final String? searchQuery;

  const SearchState({
    this.searchStatus = RequestState.initial,
    this.searchEntity,
    this.searchErrorMessage = '',
    this.apiSettingStatus = RequestState.initial,
    this.apiSettingEntity,
    this.apiSettingErrorMessage = '',
    this.priceValue=700,
    this.selectedSubCategoriesIndex,
    this.selectedSubCategoriesId,
    this.selectedColorIndex,
    this.selectedColorId,
    this.searchQuery,
  });

  SearchState copyWith({
    RequestState? searchStatus,
    SearchEntity? searchEntity,
    String? searchErrorMessage,
    ApiSettingEntity? apiSettingEntity,
    String? apiSettingErrorMessage,
    RequestState? apiSettingStatus,
    double? priceValue,
    int? selectedSubCategoriesIndex,
    int? selectedSubCategoriesId,
    int? selectedColorIndex,
    int? selectedColorId,
    String? searchQuery,

  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchEntity: searchEntity ?? this.searchEntity,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage,
      apiSettingStatus: apiSettingStatus ?? this.apiSettingStatus,
      apiSettingEntity: apiSettingEntity ?? this.apiSettingEntity,
      apiSettingErrorMessage: apiSettingErrorMessage ?? this.apiSettingErrorMessage,
      priceValue: priceValue ?? this.priceValue,
      selectedSubCategoriesId: selectedSubCategoriesId ?? this.selectedSubCategoriesId,
      selectedSubCategoriesIndex: selectedSubCategoriesIndex ?? this.selectedSubCategoriesIndex,
      selectedColorId: selectedColorId ?? this.selectedColorId,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      searchQuery: searchQuery ?? this.searchQuery,

    );
  }

  @override
  List<Object?> get props => [
    searchStatus,
    searchEntity,
    searchErrorMessage,
    apiSettingStatus,
    apiSettingEntity,
    apiSettingErrorMessage,
    priceValue,
    selectedSubCategoriesId,
    selectedSubCategoriesIndex,
    selectedColorId,
    selectedColorIndex,
    searchQuery
  ];
}
