import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor/l10n/l10n.dart';
import 'package:home_decor/src/core/resources/theme_manager.dart';
import 'package:home_decor/src/core/services/router/app_router.dart';
import 'package:home_decor/src/core/services/services_locator/services_locator.dart';
import 'package:home_decor/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_event.dart';

class HomeDecor extends StatelessWidget {
  const HomeDecor({super.key, required this.startWidget});

  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(loginUseCase: sl(), registerUseCase: sl()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(sl(), sl(), sl(), sl())
            ..add(SliderEvent())
            ..add(CategoriesEvent())
            ..add(BestSellerEvent())
            ..add(NewCollectionEvent()),
        ),
        /*BlocProvider(
          create: (context) => SearchBloc(searchUseCase: sl())
        ),*/
      ],
      child: ScreenUtilInit(
        designSize: Size(412, 915),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.createRouter(startWidget),
            locale: L10n.currentLocale,
            localeListResolutionCallback: L10n.localeListResolutionCallback,
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.dark,
          );
        },
      ),
    );
  }
}
