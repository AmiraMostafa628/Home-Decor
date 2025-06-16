import 'package:flutter/material.dart';
import 'package:home_decor/src/core/services/local_storage/cache_start_widget.dart';
import 'package:home_decor/src/core/services/services_locator/services_locator.dart';
import 'package:home_decor/src/features/app_layout/app_layout.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  await CacheStartWidget.init();
  runApp(HomeDecor(startWidget:CacheStartWidget.startWidget,));
}



