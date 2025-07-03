import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';

abstract class BaseSliderRepository{
  FutureFailure<SliderEntity> getSliderData();
}