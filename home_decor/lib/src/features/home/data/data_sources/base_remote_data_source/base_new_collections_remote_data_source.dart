import 'package:home_decor/src/features/home/data/models/new_collection_and_best_seller_model.dart';

abstract class BaseNewCollectionsRemoteDataSource{
  Future<NewCollectionAndBestSellerModel> getNewCollectionData();
}