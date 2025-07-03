import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/search/domain/entities/api_setting/api_setting_entity.dart';

abstract class BaseApiSettingRepo{
  FutureFailure<ApiSettingEntity> fetchApiSettingData();

}