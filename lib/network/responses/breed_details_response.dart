import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_details_response.g.dart';

@JsonSerializable()
class BreedDetailsResponse {
  const BreedDetailsResponse({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCode,
    required this.description,
    required this.altNames,
    required this.referenceImageId,
    required this.vetStreetUrl,

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
  @JsonKey(name: "country_code")
  final String? countryCode;
  final String description;
  final String? altNames;
  @JsonKey(name: "reference_image_id")
  final String? referenceImageId;
  @JsonKey(name: "vetstreet_url")
  final String? vetStreetUrl;
  @JsonKey(name: "life_span")
  final String? lifeSpan;

  final int? adaptability;
  @JsonKey(name: "child_friendly")
  final int? childFriendly;
  @JsonKey(name: "dog_friendly")
  final int? dogFriendly;
  @JsonKey(name: "energy_level")
  final int? energyLevel;
  final int? intelligence;
  @JsonKey(name: "shedding_level")
  final int? sheddingLevel;
  @JsonKey(name: "social_needs")
  final int? socialNeeds;
  @JsonKey(name: "wikipedia_url")
  final String? wikipediaUrl;


  factory BreedDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedDetailsResponseFromJson(json);
}


extension ModelMapper on BreedDetailsResponse {
  BreedDetails get entity => BreedDetails(
    id: id,
    name: name,
    temperament: temperament,
    origin: origin,
    countryCode: countryCode,
    description: description,
    url: vetStreetUrl,
    lifeSpan: lifeSpan,
    adaptability: adaptability,
    childFriendly: childFriendly,
    dogFriendly: dogFriendly,
    energyLevel: energyLevel,
    intelligence: intelligence,
    sheddingLevel: sheddingLevel,
    socialNeeds: socialNeeds,
    wikipediaUrl: wikipediaUrl,
  );
}
