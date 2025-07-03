import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/services/local_storage/cache_secure_services.dart';
import 'package:home_decor/src/core/services/local_storage/cached_keys.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/auth/data/data_sources/base_remote_data_source/base_login_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/models/login_model.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_login_repo.dart';

class LoginRepoImpl extends BaseLoginRepository {
  final BaseLoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});

  @override
  FutureFailure<AuthObject> login({required LoginObject loginObject}) async {
    try {
      final result = await loginRemoteDataSource.login(
        loginModel: LoginModel.fromObject(loginObject),
      );
      saveSecureData(
        key: CachedKeys.accessToken,
        value: result.accessToken,
      );

      saveSecureData(
        key: CachedKeys.refreshToken,
        value: result.refreshToken,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
