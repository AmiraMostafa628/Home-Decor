import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/enums/request_state.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';
import 'package:home_decor/src/features/search/presentation/widgets/custom_bottom_sheet.dart';
import 'package:home_decor/src/features/search/presentation/widgets/search_error.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
        previous.apiSettingStatus != current.apiSettingStatus,
        builder: (context, state){
          switch (state.apiSettingStatus) {
            case RequestState.initial:
              return Container();
            case RequestState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return CustomBottomSheet();
            case RequestState.error:
              return SearchError(
                errMessage: state.apiSettingErrorMessage,
              );
          }
        });
  }
}
