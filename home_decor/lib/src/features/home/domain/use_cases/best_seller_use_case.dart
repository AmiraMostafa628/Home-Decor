import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_repositories.dart';

class BestSellerUseCase extends BaseUseCase<NewCollectionsAndBestSellerEntity,NoParam> {
  final BaseRepository repository;
  BestSellerUseCase({required this.repository});

  @override
  Future<Either<Failure, NewCollectionsAndBestSellerEntity>> call(NoParam param) async{
    return await repository.getBestSellerData();
  }
}