import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class MyImage {
  int? id;
  String? userId;
  String? imageId;
  String? subId;
  String? createdAt;
  MyImageModel? image;

  MyImage({
    this.id,
    this.userId,
    this.imageId,
    this.subId,
    this.createdAt,
    this.image,
  });

  factory MyImage.fromJson(Map<String, dynamic> json) =>
      _$MyImageFromJson(json);

  Map<String, dynamic> toJson() => _$MyImageToJson(this);
}

@JsonSerializable()
class MyImageModel {
  int? id;
  String? url;

  MyImageModel({this.id, this.url});

  factory MyImageModel.fromJson(Map<String, dynamic> json) =>
      _$MyImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyImageModelToJson(this);
}
