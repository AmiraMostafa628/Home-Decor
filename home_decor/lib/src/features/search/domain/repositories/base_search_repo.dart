import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';

abstract class BaseSearchRepo{
  FutureFailure<SearchEntity> fetchSearchData({required SearchParamsEntity searchParams});

}