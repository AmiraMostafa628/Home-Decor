import 'package:equatable/equatable.dart';

class AuthResponseErrorModel extends Equatable{
  final Error error;

 const AuthResponseErrorModel({required this.error});

  factory AuthResponseErrorModel.fromJson(Map<String,dynamic>json){
    return AuthResponseErrorModel(
        error: Error.fromJson(json['errors']),
    );
  }

  @override
  List<Object?> get props => [
    error,
  ];
}

class Error extends Equatable{
  final String? userName;
  final String? password;

 const Error({this.userName, this.password});

 factory Error.fromJson(Map<String,dynamic>json){
   return Error(
     userName: json['username'],
     password: json['password']
   );
 }

  @override
  List<Object?> get props => [
    userName,
    password,
  ];

}