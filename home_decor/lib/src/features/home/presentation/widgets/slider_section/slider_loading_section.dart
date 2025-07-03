import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/main_carousel_slider.dart';
import 'package:home_decor/src/features/home/domain/entities/slider_data.dart';
import 'package:home_decor/src/features/home/presentation/widgets/slider_section/scroll_item_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliderLoadingSection extends StatelessWidget {
  const SliderLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: MainCarouselSlider(
        items: List.generate(4, (index) {
          return ScrollItemBuilder(
            itemLength: 4,
            item: SliderData(
                id: index,
                image: 'i$index',
            ),
            currentIndex: index,
          );
        }),
        options: CarouselOptions(
          autoPlay: true,
          height: 225,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
