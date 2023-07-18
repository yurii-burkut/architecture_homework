import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  const Favorites({
    required this.id,
    required this.image_id,
  });

  final int id;
  final String image_id;

  @override
  List<Object?> get props => [id, image_id];
}