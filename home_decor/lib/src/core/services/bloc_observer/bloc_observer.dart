
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate-- ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc,Change change) {
    super.onChange(bloc,change);
    if (kDebugMode) {
      print('onCreate-- ${bloc.runtimeType},$change');
    }
  }

  @override
  void onError(BlocBase bloc,Object error,StackTrace stackTrace) {
    super.onError(bloc,error,stackTrace);
    if (kDebugMode) {
      print('onError-- ${bloc.runtimeType},$error');
    }
  }


  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('onClose-- ${bloc.runtimeType}');
    }
  }



}