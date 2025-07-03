import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_bloc.dart';
import 'package:home_decor/src/features/search/presentation/manager/search_states.dart';
import 'package:home_decor/src/features/search/presentation/widgets/product_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: .68,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
              state.searchEntity?.items.length ?? 0, (index) {
            return ProductItem(product: state.searchEntity!.items[index],);
          }),
        );
      },
    );
  }
}
