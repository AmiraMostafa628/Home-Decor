import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/features/home/domain/entities/categories.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';
import 'package:home_decor/src/features/home/domain/entities/slider.dart';

abstract class BaseRepository{
  Future<Either<Failure,SliderEntity>> getSliderData();
  Future<Either<Failure,CategoriesEntity>> getCategoriesData();
  Future<Either<Failure,NewCollectionsAndBestSellerEntity>> getBestSellerData();
  Future<Either<Failure,NewCollectionsAndBestSellerEntity>> getNewCollectionData();
}