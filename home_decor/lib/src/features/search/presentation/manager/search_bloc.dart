import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/search/domain/use_cases/api_setting_use_case.dart';
import 'package:home_decor/src/features/search/domain/use_cases/search_use_case.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_event.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static SearchBloc get(context) => BlocProvider.of(context);
  final SearchUseCase searchUseCase;
  final ApiSettingUseCase apiSettingUseCase;

  SearchBloc({required this.searchUseCase, required this.apiSettingUseCase})
    : super(SearchState()) {
    on<FetchSearchDataEvent>(_fetchSearchData);
    on<FetchApiSettingEvent>(_fetchApiSettingData);
    on<SearchQueryEvent>(_changeSearchValue);
    on<ChangePriceValueEvent>(_changePriceValue);
    on<SelectColorEvent>(_selectColor);
    on<SelectSubCategoryEvent>(_selectSubCategory);
  }

  Future<void> _fetchSearchData(
    FetchSearchDataEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        searchStatus: RequestState.loading,
      ),
    );

    final result = await searchUseCase.call(
      param: event.searchParamEntity,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            searchStatus: RequestState.error,
            searchErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            searchStatus: RequestState.loaded,
            searchEntity: data,
            selectedSubCategoriesIndex: null,
            selectedColorIndex: null,
            searchQuery: ''
          ),
        );
      },
    );
  }

  Future<void> _fetchApiSettingData(
    FetchApiSettingEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        apiSettingStatus: RequestState.loading,
      ),
    );
    final result = await apiSettingUseCase.call(param: NoParam());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            apiSettingErrorMessage: failure.message,
            apiSettingStatus: RequestState.error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            apiSettingEntity: data,
            apiSettingStatus: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _changeSearchValue(
      SearchQueryEvent event,
      Emitter<SearchState> emit,
      ){
    emit(state.copyWith(
      searchQuery: event.searchQuery,
    ));
  }

  FutureOr<void> _changePriceValue(
      ChangePriceValueEvent event,
      Emitter<SearchState> emit,
      ){
    emit(state.copyWith(
      priceValue: event.priceValue,
    ));
  }

  FutureOr<void> _selectSubCategory(
      SelectSubCategoryEvent event,
      Emitter<SearchState> emit,
      ){
    emit(state.copyWith(
      selectedSubCategoriesId: event.selectedSubCategoryId,
      selectedSubCategoriesIndex: event.selectedSubCategoryIndex
    ));
  }


  FutureOr<void> _selectColor(
      SelectColorEvent event,
      Emitter<SearchState> emit,
      ){
    emit(state.copyWith(
        selectedColorId: event.selectedColorId,
        selectedColorIndex: event.selectedColorIndex
    ));
  }
}
