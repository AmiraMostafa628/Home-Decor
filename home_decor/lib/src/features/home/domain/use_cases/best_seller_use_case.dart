import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_bestseller_repository.dart';

class BestSellerUseCase extends BaseUseCase<NewCollectionsAndBestSellerEntity,NoParam> {
  final BaseBestSellerRepository repository;
  BestSellerUseCase({required this.repository});

  @override
 FutureFailure<NewCollectionsAndBestSellerEntity> call({required NoParam param})async {
    return await repository.getBestSellerData();
  }
}