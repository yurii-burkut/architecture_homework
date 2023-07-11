import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.url,
    this.imageUrl,
    required this.description,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String? url;
  final String? imageUrl;
  final String? description;

  @override
  List<Object?> get props => [id, name, temperament, origin, url, description];
}
