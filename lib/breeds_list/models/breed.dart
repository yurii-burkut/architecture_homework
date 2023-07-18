import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.url,
    this.imageUrl,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String? url;
  final String? imageUrl;
  final bool isFavorite;

  @override
  List<Object?> get props => [id, name, temperament, origin, url, isFavorite];
}

