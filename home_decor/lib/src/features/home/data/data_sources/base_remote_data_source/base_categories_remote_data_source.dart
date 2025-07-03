import 'package:home_decor/src/features/home/data/models/categories_model.dart';

abstract class BaseCategoriesRemoteDataSource{
  Future<CategoriesModel> getCategoriesData();
}