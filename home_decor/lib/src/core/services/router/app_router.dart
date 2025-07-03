import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:home_decor/src/features/Auth/presentation/pages/login_view.dart';
import 'package:home_decor/src/features/Auth/presentation/pages/sign_up_view.dart';
import 'package:home_decor/src/features/forget_password/presentation/pages/forget_password_view.dart';
import 'package:home_decor/src/features/forget_password/presentation/pages/set_password_view.dart';
import 'package:home_decor/src/features/app_layout/main_view.dart';
import 'package:home_decor/src/features/search/presentation/pages/search_view.dart';

class AppRouter {
  static const kOnboardingViewBody = '/onboardingViewBody';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kSetPasswordView = '/setPasswordView';
  static const kMainView = '/mainView';
  static const kSearchView = '/searchView';

  static GoRouter createRouter(Widget startWidget) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return startWidget;
          },
        ),
        GoRoute(
          path: '/loginView',
          builder: (BuildContext context, GoRouterState state) {
            return LoginView();
          },
        ),
        GoRoute(
          path: '/signUpView',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpView();
          },
        ),
        GoRoute(
          path: '/forgetPasswordView',
          builder: (BuildContext context, GoRouterState state) {
            return ForgetPasswordView();
          },
        ),
        GoRoute(
          path: '/setPasswordView',
          builder: (BuildContext context, GoRouterState state) {
            return SetPasswordView();
          },
        ),
        GoRoute(
          path: '/mainView',
          builder: (BuildContext context, GoRouterState state) {
            return MainView();
          },
        ),
        GoRoute(
          path: '/searchView',
          builder: (BuildContext context, GoRouterState state) {
            return SearchView();
          },
        ),
      ],
    );
  }
}
