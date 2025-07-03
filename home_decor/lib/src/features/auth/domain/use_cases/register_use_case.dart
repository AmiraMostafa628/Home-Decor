import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/register_object.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_register_repo.dart';

class RegisterUseCase extends BaseUseCase<AuthObject,RegisterObject>{
  final BaseRegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  @override
  FutureFailure<AuthObject> call({required RegisterObject param}) async{
   return await registerRepository.register(registerObject: param);
  }
}