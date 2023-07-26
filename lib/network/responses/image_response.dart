import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class MyImage {
 final int? id;
 final String? userId;
 final String? imageId;
 final String? subId;
 final String? createdAt;
 final MyImageModel? image;

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
  final int? id;
  final String? url;

  MyImageModel({this.id, this.url});

  factory MyImageModel.fromJson(Map<String, dynamic> json) =>
      _$MyImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyImageModelToJson(this);
}
