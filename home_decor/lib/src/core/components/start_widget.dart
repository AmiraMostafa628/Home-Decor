import 'package:flutter/material.dart';
import 'package:home_decor/src/core/services/local_storage/cache_secure_services.dart';
import 'package:home_decor/src/core/services/local_storage/cache_services.dart';
import 'package:home_decor/src/core/services/local_storage/cached_keys.dart';
import 'package:home_decor/src/features/Auth/presentation/pages/login_view.dart';
import 'package:home_decor/src/features/app_layout/main_view.dart';
import 'package:home_decor/src/features/onboarding/presentation/pages/onboarding_view.dart';

class StartScreen {
  static Widget _startWidget = OnboardingView();

  static Widget get startWidget => _startWidget;

  static Future<void> loadCacheValue() async {
    final bool token = await containSecureData(key: CachedKeys.accessToken) ?? false;
    final bool onBoarding = CacheServices.getData(CachedKeys.onBoardingKey) ?? false;
    _startWidget = onBoarding ? (token ? MainView() : LoginView()) : OnboardingView();
  }
}
