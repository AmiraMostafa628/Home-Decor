import 'package:equatable/equatable.dart';
import 'package:home_decor/src/core/type_def/type_def_either.dart';

abstract class BaseUseCase<T, Param> {
  FutureFailure<T> call({required Param param});
}

class NoParam extends Equatable{
  const NoParam();

  @override
  List<Object?> get props => [];
}
