import 'package:equatable/equatable.dart';

class SliderData extends Equatable {
  final String image;

  const SliderData({
    required this.image,
  });

  @override
  List<Object?> get props => [
    image,
  ];
}