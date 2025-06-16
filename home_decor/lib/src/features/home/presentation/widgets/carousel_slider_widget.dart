import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/components/main_carousel_slider.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/scroll_item_builder.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final data = state.slider?.data ?? [];
        return MainCarouselSlider(
          items: data.asMap().entries.map((entry) {
            final index = entry.key;
            final item  = entry.value;
            return ScrollItemBuilder(
              item: item,
              itemLength: data.length,
              currentIndex: index,
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            height: 225,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
          ),
        );
      },
    );
  }
}


