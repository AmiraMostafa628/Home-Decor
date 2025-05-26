import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable{}

class ChangeOnboardingIndex extends OnboardingEvent{
  final int currentIndex;

  ChangeOnboardingIndex({required this.currentIndex});

  @override
  List<Object?> get props => [
    currentIndex,
  ];
}