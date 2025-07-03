import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_best_seller_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_and_best_seller_model.dart';

class BestSellerRemoteDataSourceImpl extends BaseBestSellerRemoteDataSource{
  final ApiClient apiClient;
  BestSellerRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<NewCollectionAndBestSellerModel> getBestSellerData() async{
    try{
      final result = await apiClient.getData(path: ApiConstants.bestSeller);
      return NewCollectionAndBestSellerModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

}