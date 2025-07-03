import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/components/custom_text_button.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_event.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';
import 'package:home_decor/src/features/search/presentation/widgets/color_section.dart';
import 'package:home_decor/src/features/search/presentation/widgets/sub_categories.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 10.0,
                children: [
                  Text(
                    'Filter',
                    style: textTheme.headlineMedium!.copyWith(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    padding: EdgeInsets.zero,
                    min: state.apiSettingEntity!.priceRange.minPrice.toDouble(),
                    max: state.apiSettingEntity!.priceRange.maxPrice.toDouble(),
                    inactiveColor: ColorManager.lightPrimaryColor,
                    value: state.priceValue,
                    divisions: 100,
                    onChanged: (value) {
                      SearchBloc.get(
                        context,
                      ).add(ChangePriceValueEvent(priceValue: value));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${state.apiSettingEntity!.priceRange.minPrice
                            .toString()}',
                        style: textTheme.bodyMedium,
                      ),
                      Text(
                        '\$${state.apiSettingEntity!.priceRange.maxPrice
                            .toString()}',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SubCategories(),
                  ColorSection(),
                  CustomTextButton(
                    width: 300,
                    onPressed: () {
                      SearchBloc.get(context).add(
                        FetchSearchDataEvent(
                          searchParamEntity: SearchParamsEntity(
                            searchQuery: state.searchQuery,
                            subCategoryId: state.selectedSubCategoriesId?.toString(),
                            colorId: state.selectedColorId?.toString(),
                            minPrice: state
                                .apiSettingEntity!
                                .priceRange
                                .minPrice
                                .toString(),
                            maxPrice: state.priceValue.toString(),
                          ),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    text: 'Apply',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
