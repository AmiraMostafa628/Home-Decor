import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_repositories.dart';

class SliderUseCase extends BaseUseCase<SliderEntity,NoParam> {
  final BaseRepository repository;
   SliderUseCase({required this.repository});

  @override
  Future<Either<Failure, SliderEntity>> call(NoParam param) async{
    return await repository.getSliderData();
  }
}