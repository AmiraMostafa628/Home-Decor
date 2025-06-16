import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_repositories.dart';

class RepositoryImpl extends BaseRepository {
  final BaseRemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SliderEntity>> getSliderData() async {
    try {
      final result = await remoteDataSource.getSliderData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesEntity>> getCategoriesData() async{
    try {
      final result = await remoteDataSource.getCategoriesData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NewCollectionsAndBestSellerEntity>> getBestSellerData() async{
    try {
      final result = await remoteDataSource.getBestSellerData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NewCollectionsAndBestSellerEntity>> getNewCollectionData() async{
    try {
      final result = await remoteDataSource.getNewCollectionData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
