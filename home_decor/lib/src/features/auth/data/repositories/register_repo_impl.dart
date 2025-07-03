import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';
import 'package:home_decor/src/core/services/local_storage/cache_secure_services.dart';
import 'package:home_decor/src/core/services/local_storage/cached_keys.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/features/auth/data/data_sources/base_remote_data_source/base_register_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/models/register_model.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_register_repo.dart';

class RegisterRepoImpl extends BaseRegisterRepository {
  final BaseRegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl({required this.registerRemoteDataSource});

  @override
  FutureFailure<AuthObject> register({
    required RegisterObject registerObject,
  }) async {
    try {
      final result = await registerRemoteDataSource.register(
        registerModel: RegisterModel.fromObject(registerObject),
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
