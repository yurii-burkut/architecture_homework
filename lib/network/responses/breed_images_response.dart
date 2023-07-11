import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_images_response.g.dart';

@JsonSerializable()
class BreedImagesResponse {
  const BreedImagesResponse({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  factory BreedImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedImagesResponseFromJson(json);
}

extension ModelMapper on BreedImagesResponse {
  BreedImage get entity => BreedImage(
    id: id,
    url: url,
  );
}