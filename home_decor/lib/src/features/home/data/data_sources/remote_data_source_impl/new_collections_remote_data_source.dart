import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_new_collections_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_and_best_seller_model.dart';

class NewCollectionsRemoteDataSource extends BaseNewCollectionsRemoteDataSource{
  final ApiClient apiClient;
  NewCollectionsRemoteDataSource({required this.apiClient});

  @override
  Future<NewCollectionAndBestSellerModel> getNewCollectionData() async{
    try{
      final result = await apiClient.getData(path: ApiConstants.newCollections);

      return NewCollectionAndBestSellerModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }



}