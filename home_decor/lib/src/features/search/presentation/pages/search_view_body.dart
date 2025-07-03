import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';
import 'package:home_decor/src/features/search/presentation/widgets/search_error.dart';
import 'package:home_decor/src/features/search/presentation/widgets/search_loading.dart';
import 'package:home_decor/src/features/search/presentation/widgets/search_result.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.searchStatus) {
          case RequestState.initial:
            return Container();
          case RequestState.loading:
            return SearchLoading();
          case RequestState.loaded:
            return SearchResult();
          case RequestState.error:
            return SearchError(errMessage: 'There is no item like this',);
        }
      },
    );
  }
}
