import 'package:home_decor/src/features/home/domain/entities/data.dart';

class DataModel extends DataEntity {
  const DataModel({
    required super.name,
    required super.description,
    required super.price,
    required super.isSale,
    required super.salePrice,
    required super.image,
    required super.rate,
  });

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        isSale: json['is_sale'],
        salePrice: json['sale_price'],
        image: json['image'],
        rate: json['rate']
    );
  }
}
