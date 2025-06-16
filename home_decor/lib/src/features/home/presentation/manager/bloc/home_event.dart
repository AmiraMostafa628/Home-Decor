import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeHomeNavigationBar extends HomeEvent {
  final int selectedBottomNavbarIndex;

  const ChangeHomeNavigationBar({
    required this.selectedBottomNavbarIndex,
  });

  @override
  List<Object?> get props => [
    selectedBottomNavbarIndex,
  ];
}

class SliderEvent extends HomeEvent {
  const SliderEvent();

  @override
  List<Object?> get props => [
  ];
}

class CategoriesEvent extends HomeEvent {
  const CategoriesEvent();

  @override
  List<Object?> get props => [
  ];
}

class NewCollectionEvent extends HomeEvent {
  const NewCollectionEvent();

  @override
  List<Object?> get props => [
  ];
}


class BestSellerEvent extends HomeEvent {
  const BestSellerEvent();

  @override
  List<Object?> get props => [
  ];
}

