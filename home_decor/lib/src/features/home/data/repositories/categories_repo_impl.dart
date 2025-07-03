import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_categories_remote_data_source.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_categories_repository.dart';

class CategoriesRepoImpl extends BaseCategoriesRepository{
  final BaseCategoriesRemoteDataSource remoteDataSource;
  CategoriesRepoImpl({required this.remoteDataSource});

  @override
  FutureFailure<CategoriesEntity> getCategoriesData() async{
    try {
      final result = await remoteDataSource.getCategoriesData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}