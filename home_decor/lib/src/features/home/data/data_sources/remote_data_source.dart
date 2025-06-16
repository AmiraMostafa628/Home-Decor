import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constance.dart';
import 'package:home_decor/src/features/home/data/models/categories_model.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_and_best_seller_model.dart';
import 'package:home_decor/src/features/home/data/models/slider_model.dart';

abstract class BaseRemoteDataSource{
  Future<SliderModel> getSliderData();
  Future<CategoriesModel> getCategoriesData();
  Future<NewCollectionAndBestSellerModel> getBestSellerData();
  Future<NewCollectionAndBestSellerModel> getNewCollectionData();

}

class RemoteDataSourceImpl extends BaseRemoteDataSource{
  final ApiClient apiClient;
  RemoteDataSourceImpl({required this.apiClient});

  @override
  Future<SliderModel> getSliderData() async{
    try{
      final result = await apiClient.getDate(path: ApiConstance.homeSlider);
      return SliderModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }


  @override
  Future<CategoriesModel> getCategoriesData() async{
    try{
      final result = await apiClient.getDate(path: ApiConstance.homeCategories);
      return CategoriesModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

  @override
  Future<NewCollectionAndBestSellerModel> getNewCollectionData() async{
    try{
      final result = await apiClient.getDate(path: ApiConstance.newCollections);

      return NewCollectionAndBestSellerModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

  @override
  Future<NewCollectionAndBestSellerModel> getBestSellerData() async{
    try{
      final result = await apiClient.getDate(path: ApiConstance.bestSeller);

     return NewCollectionAndBestSellerModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }

  }





}