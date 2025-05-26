import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/features/onboarding/presentation/pages/onboarding_view.dart';

class AppRouter {
  static const kOnboardingViewBody = '/onboardingViewBody';

  static GoRouter createRouter() {
    return GoRouter(
        routes: [
          GoRoute(
              path: '/',
            builder: (BuildContext context,GoRouterState state){
                return OnboardingView();
            }
          )

        ]);
  }
}
