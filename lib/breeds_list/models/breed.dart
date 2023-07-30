import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.url,
    this.imageUrl,
    required this.life_span,
    required this.metric,
    required this.wikipedia_url,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String? url;
  final String? imageUrl;
  final String life_span;
  final String metric;
  final String? wikipedia_url;

  @override
  List<Object?> get props => [id, name, temperament, origin, url, wikipedia_url];
}
