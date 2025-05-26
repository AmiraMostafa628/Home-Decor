import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/features/onboarding/presentation/manager/onboarding_event.dart';
import 'package:home_decor/src/features/onboarding/presentation/manager/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  OnboardingBloc() : super(OnboardingStates()) {

    on<ChangeOnboardingIndex>(_changeOnboardingIndex);
  }

  FutureOr<void> _changeOnboardingIndex(
    ChangeOnboardingIndex event,
    Emitter<OnboardingStates> emit,
  ) {
    emit(
      state.copyWith(
        changeOnboardingCurrentIndex: event.currentIndex,
      ),
    );
  }
}
