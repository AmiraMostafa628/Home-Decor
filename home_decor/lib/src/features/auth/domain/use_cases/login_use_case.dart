import 'package:home_decor/src/core/type_def/type_def_either.dart';
import 'package:home_decor/src/core/use_case/base_use_case.dart';
import 'package:home_decor/src/features/auth/domain/entities/auth_object.dart';
import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_login_repo.dart';

class LoginUseCase extends BaseUseCase<AuthObject,LoginObject>{
  final BaseLoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});


  @override
  FutureFailure<AuthObject> call({required LoginObject param}) async{
   return await loginRepository.login(loginObject: param);
  }


}