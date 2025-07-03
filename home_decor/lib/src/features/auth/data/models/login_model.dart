import 'package:home_decor/src/features/auth/domain/entities/login_object.dart';

class LoginModel extends LoginObject {
  const LoginModel({
    required super.userName,
    required super.password,
  });

  factory LoginModel.fromObject(LoginObject object) {
    return LoginModel(
      userName: object.userName,
      password: object.password,
    );
  }

  Map<String,dynamic> toJson()=>{
    'username': userName,
    'password' : password,
  };
}
