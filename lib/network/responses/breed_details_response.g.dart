// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedDetailsResponse _$BreedDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    BreedDetailsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      countryCode: json['country_code'] as String?,
      description: json['description'] as String,
      altNames: json['altNames'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
      vetStreetUrl: json['vetstreet_url'] as String?,
      lifeSpan: json['life_span'] as String?,
      adaptability: json['adaptability'] as int?,
      childFriendly: json['child_friendly'] as int?,
      dogFriendly: json['dog_friendly'] as int?,
      energyLevel: json['energy_level'] as int?,
      intelligence: json['intelligence'] as int?,
      sheddingLevel: json['shedding_level'] as int?,
      socialNeeds: json['social_needs'] as int?,
      wikipediaUrl: json['wikipedia_url'] as String?,
    );

Map<String, dynamic> _$BreedDetailsResponseToJson(
        BreedDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'country_code': instance.countryCode,
      'description': instance.description,
      'altNames': instance.altNames,
      'reference_image_id': instance.referenceImageId,
      'vetstreet_url': instance.vetStreetUrl,
      'life_span': instance.lifeSpan,
      'adaptability': instance.adaptability,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'wikipedia_url': instance.wikipediaUrl,
    };
