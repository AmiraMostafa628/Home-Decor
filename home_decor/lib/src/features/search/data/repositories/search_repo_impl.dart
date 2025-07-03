import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:home_decor/src/features/search/data/models/search_model/search_params_model.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_entity.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_search_repo.dart';

class SearchRepoImpl extends BaseSearchRepo {
  final BaseSearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  FutureFailure<SearchEntity> fetchSearchData({
    required SearchParamsEntity searchParams,
  }) async {
    try {
      final result = await searchRemoteDataSource.fetchSearchData(
        searchParams: SearchParamsModel.fromObject(searchParams),
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
