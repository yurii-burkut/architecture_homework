import 'package:architecture_sample/breeds_list/models/favorites.dart';

class BreedFavoritesPostResponse {
  final String message;
  final int id;

  const BreedFavoritesPostResponse({
    required this.message,
    required this.id,
  });

  factory BreedFavoritesPostResponse.fromJson(Map<String, dynamic> json) =>
      BreedFavoritesPostResponse(
        message: json['massage'] as String,
        id: json['id'] as int,
      );
}

class BreedFavoritesGetResponse {
  final int id;
  final String userId;
  final String imageId;
  final String subId;
  final String createdAt;
  final Image? image;

  BreedFavoritesGetResponse({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });
  factory BreedFavoritesGetResponse.fromJson(Map<String, dynamic> json) =>
      BreedFavoritesGetResponse(
        id: json['id'] as int,
        userId: json['user_id'] as String,
        imageId: json["image_id"] as String,
        subId: json['sub_id'] as String,
        createdAt:  json['created_at'] as String,
        image: json['image'] == null ? null : Image.fromJson(json['image'] as Map<String, dynamic>),
      );
}
extension ModelMapper on BreedFavoritesGetResponse {
  Favorites get entity => Favorites(
    id: id,
    imageId: imageId,
    url: image!.url,
  );
}

class Image {
  final String id;
  final String url;

  const Image({required this.id, required this.url});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as String,
        url: json['url'] as String,
      );
}
