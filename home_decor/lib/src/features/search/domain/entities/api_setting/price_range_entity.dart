import 'package:equatable/equatable.dart';

class PriceRangeEntity extends Equatable {
  final num minPrice;
  final num maxPrice;

  const PriceRangeEntity({
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  List<Object?> get props => [
    minPrice,
    maxPrice,
  ];
}
