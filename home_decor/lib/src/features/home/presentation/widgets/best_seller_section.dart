import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_item.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final data = state.bestSeller!.data;
        return SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return BestSellerItem(bestSeller: data[index]);
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20.0,
            ),
            itemCount: state.bestSeller!.data.length,
          ),
        );
      },
    );
  }
}
