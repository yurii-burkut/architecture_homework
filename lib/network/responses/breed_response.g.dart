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
      life_span: json['life_span'] as String,
      weight: Weight.fromJson(json['weight'] as Map<String, dynamic>),
      wikipedia_url: json['wikipedia_url'] as String?,
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
      'life_span': instance.life_span,
      'weight': instance.weight,
      'wikipedia_url': instance.wikipedia_url,
    };

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$WeightToJson(Weight instance) => <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
