import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_slider_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/models/slider_model.dart';

class SliderRemoteDataSourceImpl extends BaseSliderRemoteDataSource{
  final ApiClient apiClient;
  SliderRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<SliderModel> getSliderData() async{
    try{
      final result = await apiClient.getData(path: ApiConstants.homeSlider);
      return SliderModel.fromJson(result.data);

    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

}