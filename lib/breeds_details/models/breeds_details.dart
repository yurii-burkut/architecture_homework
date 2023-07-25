import 'package:equatable/equatable.dart';

class BreedDetails extends Equatable {
  const BreedDetails({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCode,
    required this.description,
    required this.url,

    required this.lifeSpan,
    required this.adaptability,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.wikipediaUrl,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String? countryCode;
  final String description;
  final String? url;
  final String? lifeSpan;
  final int? adaptability;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final String? wikipediaUrl;

  @override
  List<Object?> get props => [
    id,
    name,
    temperament,
    origin,
    countryCode,
    description,
    url,
    lifeSpan,
    adaptability,
    childFriendly,
    dogFriendly,
    energyLevel,
    intelligence,
    sheddingLevel,
    socialNeeds,
    wikipediaUrl
  ];
}