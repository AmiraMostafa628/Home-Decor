import 'package:home_decor/src/features/home/data/models/slider_data_model.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';

class SliderModel extends SliderEntity {
  const SliderModel({
    required super.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      data: List<SliderDataModel>.from(
        json['data'].map((e) => SliderDataModel.fromJson(e)),
      ),
    );
  }
}
