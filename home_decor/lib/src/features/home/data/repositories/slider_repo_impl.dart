import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_slider_remote_data_source.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_slider_repository.dart';

class SliderRepoImpl extends BaseSliderRepository{
  final BaseSliderRemoteDataSource remoteDataSource;
  SliderRepoImpl({required this.remoteDataSource});

  @override
  FutureFailure<SliderEntity> getSliderData() async{
    try {
      final result = await remoteDataSource.getSliderData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }


}