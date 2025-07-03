import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/connection/failure.dart';

typedef FutureFailure<T> =  Future<Either<Failure,T>>;