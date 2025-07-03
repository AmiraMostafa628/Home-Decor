import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_slider_repository.dart';

class SliderUseCase extends BaseUseCase<SliderEntity,NoParam> {
  final BaseSliderRepository repository;
   SliderUseCase({required this.repository});

  @override
  FutureFailure<SliderEntity> call({required NoParam param}) async{
    return await repository.getSliderData();
  }
}