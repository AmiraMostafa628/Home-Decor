import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:home_decor/src/features/search/data/models/api_setting_model/api_setting_model.dart';

class ApiSettingRemoteDataSourceImpl extends BaseApiSettingRemoteDataSource {
  final ApiClient apiClient;

  ApiSettingRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<ApiSettingModel> fetchApiSettingData() async{
    try{
      final response = await apiClient.getData(
        path: ApiConstants.apiSetting,
      );
      return ApiSettingModel.fromJson(response.data);

    }catch(e){
      throw ServerFailure(message: e.toString());
    }
  }




}
