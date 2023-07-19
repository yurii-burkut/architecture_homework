import 'package:json_annotation/json_annotation.dart';
part 'favourites_response.g.dart';

@JsonSerializable()
class FavouritesResponse {
  int? id;
  String? userId;
  String? imageId;
  String? subId;
  String? createdAt;
  Image? image;

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
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image_id'] = this.imageId;
    data['sub_id'] = this.subId;
    data['created_at'] = this.createdAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? id;
  String? url;

  Image({this.id, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}