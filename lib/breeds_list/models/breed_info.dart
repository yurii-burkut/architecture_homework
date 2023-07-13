import 'package:equatable/equatable.dart';

class BreedInfo extends Equatable {
  final String id;
  final String name;
  final String? vetstreetUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String description;
  final String? lifeSpan;
  final int? indoor;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;

  const BreedInfo({
    required this.id,
    required this.name,
    required this.vetstreetUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        vetstreetUrl,
        temperament,
        origin,
        countryCode,
        description,
        lifeSpan,
        indoor,
        altNames,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        healthIssues,
        intelligence,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        hypoallergenic
      ];
}
