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

  @override
  List<Object?> get props => [];
}

class CategoriesEvent extends HomeEvent {

  @override
  List<Object?> get props => [
  ];
}

class NewCollectionEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}


class BestSellerEvent extends HomeEvent {

  @override
  List<Object?> get props => [];
}

