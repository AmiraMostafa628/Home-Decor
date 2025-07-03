import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';

abstract class BaseNewCollectionsRepository{
  FutureFailure<NewCollectionsAndBestSellerEntity> getNewCollectionData();
}