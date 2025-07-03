import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/api_setting_entity.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_api_setting_repo.dart';

class ApiSettingUseCase extends BaseUseCase<ApiSettingEntity, NoParam> {
  final BaseApiSettingRepo apiSettingRepo;

  ApiSettingUseCase({required this.apiSettingRepo});

  @override
  FutureFailure<ApiSettingEntity> call({required NoParam param}) async{
    return await apiSettingRepo.fetchApiSettingData();
  }
}
