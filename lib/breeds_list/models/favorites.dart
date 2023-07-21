import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  const Favorites({
    required this.id,
    required this.imageId,
    required this.url,

  });

  final int id;
  final String imageId;
  final String url;

  @override
  List<Object?> get props => [id, imageId, url];
}