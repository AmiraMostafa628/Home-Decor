import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/theme_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.createRouter(),
      localeListResolutionCallback: L10n.localeListResolutionCallback,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: getAppLightTheme(),
    );
  }
}

