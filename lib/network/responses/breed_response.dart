import 'dart:core';
import 'dart:core';

import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';

@JsonSerializable()
class BreedResponse {
  const BreedResponse({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.altNames,
    required this.referenceImageId,
    required this.vetStreetUrl,
    required this.wikipediaUrl,
    //required this.weight,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String? altNames;
  @JsonKey(name: "reference_image_id")
  final String? referenceImageId;
  @JsonKey(name: "vetstreet_url")
  final String? vetStreetUrl;
  final String? wikipediaUrl;

  String get image => 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
}

extension ModelMapper on BreedResponse {
  Breed get entity => Breed(
        id: id,
        name: name,
        temperament: temperament,
        origin: origin,
        url: vetStreetUrl,
        imageUrl: image,
        wikipediaUrl: wikipediaUrl,
        description: description,
        referenceImageId: referenceImageId,
      );
}
