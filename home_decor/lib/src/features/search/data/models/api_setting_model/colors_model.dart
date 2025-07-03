import 'package:home_decor/src/features/search/domain/entities/api_setting/colors_entity.dart';

class ColorsModel extends ColorEntity {
  const ColorsModel({
    required super.id,
    required super.name,
    required super.hexColor,
  });

  factory ColorsModel.fromJson(Map<String, dynamic> json) {
    return ColorsModel(
      id: json['id'],
      name: json['name'],
      hexColor: json['hex'],
    );
  }
}
