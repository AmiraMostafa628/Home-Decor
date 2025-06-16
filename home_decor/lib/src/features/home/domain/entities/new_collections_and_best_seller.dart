import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/home/domain/entities/data.dart';

class NewCollectionsAndBestSellerEntity extends Equatable {
  final List<DataEntity> data;

  const NewCollectionsAndBestSellerEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [
    data,

  ];
}
