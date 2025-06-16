import 'package:home_decor/src/features/home/domain/entities/slider_data.dart';

class SliderDataModel extends SliderData{
  const SliderDataModel({required super.image});

  factory SliderDataModel.fromJson(Map<String,dynamic> json){
    return SliderDataModel(image: json['image']);
  }


}