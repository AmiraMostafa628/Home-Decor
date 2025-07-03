import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/components/adaptive_input_field.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/core/services/services_locator/services_locator.dart';
import 'package:home_decor/src/core/services/validation/search_validation_service.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_event.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';
import 'package:home_decor/src/features/search/presentation/pages/search_view_body.dart';
import 'package:home_decor/src/features/search/presentation/widgets/bottom_sheet_content.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key,});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            SearchBloc(searchUseCase: sl(), apiSettingUseCase: sl())
              ..add(FetchApiSettingEvent()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 30,
              children: [
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return AdaptiveInputField(
                      context: context,
                      controller: searchController,
                      hintText: 'Search',
                      prefix: CircleAvatar(
                        child: Icon(
                          Icons.tune,
                          color: ColorManager.blackColor,
                        ),
                      ),
                      prefixPressed: () {
                        final bloc = SearchBloc.get(context);
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                              value:bloc,
                                child: BottomSheetContent());

                          },
                        );
                      },
                      suffix: CircleAvatar(
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      onSubmit: (value) {
                        SearchBloc.get(context).add(
                         SearchQueryEvent(searchQuery: value)
                        );
                        SearchBloc.get(context).add(
                          FetchSearchDataEvent(
                            searchParamEntity: SearchParamsEntity(
                              searchQuery: value,
                            ),
                          ),
                        );
                      },
                      suffixPressed: () {
                        SearchBloc.get(context).add(
                            SearchQueryEvent(searchQuery: searchController.text)
                        );
                        SearchBloc.get(context).add(
                          FetchSearchDataEvent(
                            searchParamEntity: SearchParamsEntity(
                              searchQuery: searchController.text,
                            ),
                          ),
                        );
                      },
                      fillColor: Colors.transparent,
                      borderSide: ColorManager.primaryColor,
                      hintTextColor: Colors.grey,
                      heightAfterIt: 20.0,
                      validate: (value) {
                        return searchValid(value: value);
                      },
                    );
                  },
                ),
                SearchViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
