import 'package:home_decor/src/features/home/data/models/categories_data_model.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({
    required super.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      data: List<CategoriesDataModel>.from(
        json['data'].map((e) => CategoriesDataModel.fromJson(e)),
      ),
    );
  }
}
