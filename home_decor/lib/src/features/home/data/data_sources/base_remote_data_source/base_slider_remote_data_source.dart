import 'package:home_decor/src/features/home/data/models/slider_model.dart';

abstract class BaseSliderRemoteDataSource{
  Future<SliderModel> getSliderData();
}