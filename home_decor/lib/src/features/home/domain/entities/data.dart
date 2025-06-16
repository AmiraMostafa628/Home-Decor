import 'package:equatable/equatable.dart';

class DataEntity extends Equatable{
  final String name;
  final String description;
  final num price;
  final bool isSale;
  final dynamic salePrice;
  final String image;
  final double rate;

  const DataEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.isSale,
    required this.salePrice,
    required this.image,
    required this.rate,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    price,
    isSale,
    salePrice,
    image,
    rate,
  ];
}