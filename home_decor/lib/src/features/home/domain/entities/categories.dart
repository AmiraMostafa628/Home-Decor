import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/home/domain/entities/categories_data.dart';

class CategoriesEntity extends Equatable {
  final List<CategoriesData> data;


  const CategoriesEntity({
    required this.data,

  });

  @override
  List<Object?> get props => [
    data,
  ];
}
