import 'package:equatable/equatable.dart';

class SliderData extends Equatable {
  final int id;
  final String image;

  const SliderData({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    image,
  ];
}