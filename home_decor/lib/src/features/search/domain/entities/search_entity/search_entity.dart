import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/search/domain/entities/search_entity/search_items_entity.dart';

class SearchEntity extends Equatable {
  final List<SearchItemsEntity> items;

  const SearchEntity({
    required this.items,
  });

  @override
  List<Object?> get props => [
    items,
  ];
}
