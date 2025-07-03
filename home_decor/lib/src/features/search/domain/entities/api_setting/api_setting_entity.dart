import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/colors_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/price_range_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/sub_categories_entity.dart';

class ApiSettingEntity extends Equatable {
  final PriceRangeEntity priceRange;
  final List<SubCategoriesEntity> subCategories;
  final List<ColorEntity> colors;

  const ApiSettingEntity({
    required this.priceRange,
    required this.subCategories,
    required this.colors,
  });

  @override
  List<Object?> get props => [
    priceRange,
    subCategories,
    colors,
  ];
}
