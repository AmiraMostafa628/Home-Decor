import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/extensions/color_extensions.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_event.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            Text(
              'Colors',
              style: textTheme.bodyLarge!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: state.apiSettingEntity!.colors.asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                var item = entry.value;
                bool selectedIndex =
                    index == state.selectedColorIndex;
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      SearchBloc.get(context).add(
                        SelectColorEvent(
                          selectedColorId: item.id,
                          selectedColorIndex: index,
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: selectedIndex
                          ? ColorManager.blackColor
                          : Colors.transparent,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: MyHexColor(item.hexColor),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
