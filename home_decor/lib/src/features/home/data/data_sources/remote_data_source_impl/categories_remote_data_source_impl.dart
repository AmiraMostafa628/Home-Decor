import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_categories_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/models/categories_model.dart';

class CategoriesRemoteDataSourceImpl extends BaseCategoriesRemoteDataSource{
  final ApiClient apiClient;
  CategoriesRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<CategoriesModel> getCategoriesData() async{
    try{
      final result = await apiClient.getData(path: ApiConstants.homeCategories);
      return CategoriesModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

}