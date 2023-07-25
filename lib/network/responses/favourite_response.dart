import 'package:json_annotation/json_annotation.dart';

import '../../favourite/models/favourite.dart';

part 'favourite_response.g.dart';

@JsonSerializable()
class FavouriteResponse {
  const FavouriteResponse({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.image,

  });

  final int id;
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "image_id")
  final String imageId;
  @JsonKey(name: "sub_id")
  final String subId;
  final ImageUrlResp image;




  factory FavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseFromJson(json);
}

@JsonSerializable()
class ImageUrlResp {
  const ImageUrlResp ({
    required this.url,
  });

  final String url;

  factory ImageUrlResp.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlRespFromJson(json);

}

extension ImageModelMapper on ImageUrlResp {
  ImageUrl get toEntity => ImageUrl(url: url);
}


extension ModelMapper on FavouriteResponse {
  Favourite get entity => Favourite(
    id: id,
    userId: userId,
    imageId: imageId,
    subId: subId,
    image: image.toEntity,
  );
}
