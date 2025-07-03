import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_event.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sub Categories',
              style: textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: state.apiSettingEntity!.subCategories
                  .asMap()
                  .entries
                  .map((entry) {
                    int index = entry.key;
                    var item = entry.value;
                    bool selectedIndex =
                        index == state.selectedSubCategoriesIndex;
                    return GestureDetector(
                      onTap: () {
                        SearchBloc.get(context).add(
                          SelectSubCategoryEvent(
                            selectedSubCategoryId: item.id,
                            selectedSubCategoryIndex: index,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.only(
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex
                              ? ColorManager.darkPrimaryColor
                              : ColorManager.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          item.name,
                          style: textTheme.bodyLarge!.copyWith(
                            color: ColorManager.hintTextColor,
                          ),
                        ),
                      ),
                    );
                  })
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
