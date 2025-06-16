import 'package:equatable/equatable.dart';
import 'package:home_decor/src/features/home/domain/entities/slider_data.dart';

class SliderEntity extends Equatable {
  final List<SliderData> data;

  const SliderEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [
    data,
  ];
}

