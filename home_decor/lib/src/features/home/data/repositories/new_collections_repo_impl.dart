import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_new_collections_remote_data_source.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_new_collections_repository.dart';

class NewCollectionsRepoImpl extends BaseNewCollectionsRepository{
  final BaseNewCollectionsRemoteDataSource remoteDataSource;

  NewCollectionsRepoImpl({required this.remoteDataSource});

  @override
  FutureFailure<NewCollectionsAndBestSellerEntity> getNewCollectionData() async{
    try {
      final result = await remoteDataSource.getNewCollectionData();
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }


}