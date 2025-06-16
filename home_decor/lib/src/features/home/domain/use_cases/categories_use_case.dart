import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_repositories.dart';

class CategoriesUseCase extends BaseUseCase<CategoriesEntity,NoParam> {
  final BaseRepository repository;
  CategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, CategoriesEntity>> call(NoParam param) async{
    return await repository.getCategoriesData();
  }
}