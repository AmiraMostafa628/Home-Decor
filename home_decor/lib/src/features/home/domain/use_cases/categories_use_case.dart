import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_categories_repository.dart';

class CategoriesUseCase extends BaseUseCase<CategoriesEntity,NoParam> {
  final BaseCategoriesRepository repository;
  CategoriesUseCase({required this.repository});

  @override
  FutureFailure<CategoriesEntity> call({required NoParam param}) async{
    return await repository.getCategoriesData();
  }
}