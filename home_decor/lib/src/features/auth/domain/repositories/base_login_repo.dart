import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';

abstract class BaseLoginRepository{
  FutureFailure<AuthObject> login({required LoginObject loginObject });
}