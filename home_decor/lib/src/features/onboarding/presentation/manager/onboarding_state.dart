import 'package:equatable/equatable.dart';

class OnboardingStates extends Equatable {
  final int changeOnboardingCurrentIndex;

  const OnboardingStates({
    this.changeOnboardingCurrentIndex = 0,
  });

  OnboardingStates copyWith({
    int? changeOnboardingCurrentIndex,
  }) {
    return OnboardingStates(
      changeOnboardingCurrentIndex:
          changeOnboardingCurrentIndex ?? this.changeOnboardingCurrentIndex,
    );
  }

  @override
  List<Object?> get props => [
    changeOnboardingCurrentIndex,
  ];
}
