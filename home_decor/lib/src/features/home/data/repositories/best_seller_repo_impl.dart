import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_best_seller_remote_data_source.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_bestseller_repository.dart';

class BestSellerRepoImpl extends BaseBestSellerRepository{
  final BaseBestSellerRemoteDataSource remoteDataSource;
  BestSellerRepoImpl({required this.remoteDataSource});

  @override
  FutureFailure<NewCollectionsAndBestSellerEntity> getBestSellerData() async{
    try {
      final result = await remoteDataSource.getBestSellerData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }


}