import 'package:home_decor/src/features/auth/data/models/register_model.dart';
import 'package:home_decor/src/features/auth/data/models/register_response_model.dart';

abstract class BaseRegisterRemoteDataSource{
  Future<RegisterResponseModel> register({required RegisterModel registerModel});
}