import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.url,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String? url;
  final String? imageUrl;

  @override
  List<Object?> get props => [id, name, description, temperament, origin, url, imageUrl];
}
