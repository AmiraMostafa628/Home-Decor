import 'package:equatable/equatable.dart';

class Onboarding extends Equatable {
  final String image;
  final String title;
  final String details;

  const Onboarding({
    required this.image,
    required this.title,
    required this.details,
  });

  @override
  List<Object?> get props => [
    image,
    title,
    details,
  ];
}
