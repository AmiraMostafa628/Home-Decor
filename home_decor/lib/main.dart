import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/components/start_widget.dart';
import 'package:home_decor/src/core/services/bloc_observer/bloc_observer.dart';
import 'package:home_decor/src/core/services/local_storage/cache_services.dart';
import 'package:home_decor/src/core/services/services_locator/services_locator.dart';
import 'package:home_decor/src/features/app_layout/app_layout.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  await CacheServices.init();
  Bloc.observer = MyBlocObserver();
  await StartScreen.loadCacheValue();
  runApp(HomeDecor(startWidget:StartScreen.startWidget,));
}



