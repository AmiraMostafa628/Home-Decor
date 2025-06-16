import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_decor/src/core/connection/failure.dart';

abstract class BaseUseCase<T, Param> {
  Future<Either<Failure, T>> call(Param param);
}

class NoParam extends Equatable{
  const NoParam();

  @override
  List<Object?> get props => [];
}
