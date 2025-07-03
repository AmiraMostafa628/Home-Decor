import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_search_repo.dart';

class SearchUseCase extends BaseUseCase<SearchEntity,SearchParamsEntity>{
  final BaseSearchRepo searchRepo;
  SearchUseCase({required this.searchRepo});

  @override
  FutureFailure<SearchEntity> call({required SearchParamsEntity param}) async{
    return await searchRepo.fetchSearchData(searchParams: param);
  }


}