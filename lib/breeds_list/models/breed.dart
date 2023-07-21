import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.url,
    required this.referenceImageId,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String? url;
  final String? referenceImageId;
  final String? imageUrl;

  @override
  List<Object?> get props => [id, name, temperament, origin, url];
}
