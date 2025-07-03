import 'package:home_decor/src/features/auth/data/models/login_response_model.dart';
import 'package:home_decor/src/features/auth/data/models/login_model.dart';

abstract class BaseLoginRemoteDataSource{
  Future<LoginResponseModel> login({required LoginModel loginModel});
}