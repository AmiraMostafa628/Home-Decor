import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';

abstract class BaseRegisterRepository{
  FutureFailure<AuthObject> register({required RegisterObject registerObject });
}