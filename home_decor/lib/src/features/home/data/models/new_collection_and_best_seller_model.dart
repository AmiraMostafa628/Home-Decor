import 'package:home_decor/src/features/home/data/models/data_model.dart';
import 'package:home_decor/src/features/home/domain/entities/new_collections_and_best_seller.dart';

class NewCollectionAndBestSellerModel
    extends NewCollectionsAndBestSellerEntity {
  const NewCollectionAndBestSellerModel({
    required super.data,
  });

  factory NewCollectionAndBestSellerModel.fromJson(Map<String, dynamic> json) {
    return NewCollectionAndBestSellerModel(
      data: List<DataModel>.from(
        json['data'].map((e) => DataModel.fromJson(e)),
      ),
    );
  }
}
