import 'package:equatable/equatable.dart';

class BreedImage extends Equatable {
  const BreedImage({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  @override
  List<Object?> get props => [id, url];
}