// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedResponse _$BreedResponseFromJson(Map<String, dynamic> json) =>
    BreedResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      description: json['description'] as String,
      altNames: json['altNames'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
      vetStreetUrl: json['vetstreet_url'] as String?,
      wikipediaUrl: json['wikipedia_url'] as String?,
    );

Map<String, dynamic> _$BreedResponseToJson(BreedResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'altNames': instance.altNames,
      'reference_image_id': instance.referenceImageId,
      'vetstreet_url': instance.vetStreetUrl,
       'wikipedia_url': instance.wikipediaUrl,
    };
