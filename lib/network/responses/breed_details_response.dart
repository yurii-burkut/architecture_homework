import 'package:json_annotation/json_annotation.dart';

import '../../breeds_list/models/breed_details.dart';

part 'breed_details_response.g.dart';

@JsonSerializable()
class BreedDetailsResponse {
  const BreedDetailsResponse({
    // Опис полів відповіді для деталей породи
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
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

  // Опис полів відповіді для деталей породи
  final Weight? weight;
  final String? id;
  final String? name;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String? description;
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? catFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? bidability;
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

  String get image => 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';


  factory BreedDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedDetailsResponseToJson(this);
}

@JsonSerializable()
class Weight {
  const Weight({
    required this.imperial,
    required this.metric,
  });

  final String? imperial;
  final String? metric;

  factory Weight.fromJson(Map<String, dynamic> json) =>
      _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}

extension ModelMapper on BreedDetailsResponse {
  BreedDetails get entity => BreedDetails(
    weight: weight != null ? Weight.fromJson(weight!.toJson()) : Weight(imperial: '', metric: ''),
    id: id ?? '',
    name: name ?? '',
    cfaUrl: cfaUrl ?? '',
    vetstreetUrl: vetstreetUrl ?? '',
    vcahospitalsUrl: vcahospitalsUrl ?? '',
    temperament: temperament ?? '',
    origin: origin ?? '',
    countryCodes: countryCodes ?? '',
    countryCode: countryCode ?? '',
    description: description ?? '',
    lifeSpan: lifeSpan ?? '',
    indoor: indoor ?? 0,
    lap: lap ?? 0,
    adaptability: adaptability ?? 0,
    affectionLevel: affectionLevel ?? 0,
    childFriendly: childFriendly ?? 0,
    catFriendly: catFriendly ?? 0,
    dogFriendly: dogFriendly ?? 0,
    energyLevel: energyLevel ?? 0,
    grooming: grooming ?? 0,
    healthIssues: healthIssues ?? 0,
    intelligence: intelligence ?? 0,
    sheddingLevel: sheddingLevel ?? 0,
    socialNeeds: socialNeeds ?? 0,
    strangerFriendly: strangerFriendly ?? 0,
    vocalisation: vocalisation ?? 0,
    bidability: bidability ?? 0,
    experimental: experimental ?? 0,
    hairless: hairless ?? 0,
    natural: natural ?? 0,
    rare: rare ?? 0,
    rex: rex ?? 0,
    suppressedTail: suppressedTail ?? 0,
    shortLegs: shortLegs ?? 0,
    wikipediaUrl: wikipediaUrl ?? '',
    hypoallergenic: hypoallergenic ?? 0,
    imageUrl: image?? '',
  );
}
