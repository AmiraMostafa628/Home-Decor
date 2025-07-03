import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/api_setting_entity.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_api_setting_repo.dart';

class ApiSettingRepoImpl extends BaseApiSettingRepo {
  final BaseApiSettingRemoteDataSource apiSettingRemoteDataSource;

  ApiSettingRepoImpl({required this.apiSettingRemoteDataSource});

  @override
  FutureFailure<ApiSettingEntity> fetchApiSettingData() async {
    try {
      final result = await apiSettingRemoteDataSource.fetchApiSettingData();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
