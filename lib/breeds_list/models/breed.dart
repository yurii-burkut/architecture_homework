import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.url,
    this.imageUrl,
    this.wikipediaUrl,
    required this.description,
    required this.referenceImageId,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String? url;
  final String? imageUrl;
  final String? wikipediaUrl;
  final String? description;
  final String? referenceImageId;


  @override
  List<Object?> get props => [id, name, temperament,
    origin, url,wikipediaUrl,description,referenceImageId,
  ];
}
