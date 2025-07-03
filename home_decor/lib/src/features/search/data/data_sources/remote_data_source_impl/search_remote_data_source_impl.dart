import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:home_decor/src/features/search/data/models/search_model/search_model.dart';
import 'package:home_decor/src/features/search/data/models/search_model/search_params_model.dart';

class SearchRemoteDataSourceImpl extends BaseSearchRemoteDataSource {
  final ApiClient apiClient;

  SearchRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<SearchModel> fetchSearchData({required SearchParamsModel searchParams}) async {
   try{

     final response = await apiClient.postData(
       path: ApiConstants.search,
       data: searchParams.toJson(),
     );
     return SearchModel.fromJson(response.data);

   }catch(e){
     throw ServerFailure(message: e.toString());
   }

  }


}
