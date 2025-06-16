import 'package:home_decor/src/features/home/domain/entities/categories_data.dart';

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({
    required super.id,
    required super.name,
    required super.icon,
  });
  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}
