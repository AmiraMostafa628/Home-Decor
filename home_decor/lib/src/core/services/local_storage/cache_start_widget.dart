import 'package:flutter/material.dart';
import 'package:home_decor/src/features/Auth/presentation/pages/login_view.dart';
import 'package:home_decor/src/features/home/presentation/pages/home_view.dart';
import 'package:home_decor/src/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheStartWidget{
  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    await loadCacheValue();
  }

  static Widget _startWidget = OnboardingView();
  static Widget get startWidget => _startWidget ;

  static String loginKey = 'LoginKey' ;
  static String onBoardingKey = 'OnBoardingKey' ;

  static Future<void> loadCacheValue () async {
    final bool isLogin = sharedPreferences.getBool(loginKey) ?? false ;
    final bool onBoarding = sharedPreferences.getBool(onBoardingKey) ?? false ;
    _startWidget = onBoarding ?(isLogin?HomeView():LoginView()):OnboardingView();


  }

 static Future<void> saveIsLogin () async {
    sharedPreferences.setBool(loginKey, true) ;
    await loadCacheValue();
  }

  static Future<void> saveOnboarding() async {
    sharedPreferences.setBool(onBoardingKey, true) ;
    await loadCacheValue();

  }
}