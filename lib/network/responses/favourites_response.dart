import 'package:json_annotation/json_annotation.dart';
part 'favourites_response.g.dart';

@JsonSerializable()
class FavouritesResponse {
  late final int? id;
  late final String? userId;
  late final String? imageId;
  late final String? subId;
  late final String? createdAt;
  late final Image? image;

  FavouritesResponse(
      {this.id,
        this.userId,
        this.imageId,
        this.subId,
        this.createdAt,
        this.image});

  FavouritesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    imageId = json['image_id'];
    subId = json['sub_id'];
    createdAt = json['created_at'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['image_id'] = imageId;
    data['sub_id'] = subId;
    data['created_at'] = createdAt;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Image {
  late final String? id;
  late final String? url;

  Image({this.id, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}