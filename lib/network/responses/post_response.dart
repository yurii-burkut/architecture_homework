import 'package:json_annotation/json_annotation.dart';
import '../../breeds_list/models/image_post.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse{
  final String message;
  @JsonKey(name: 'id')
  final int id;

  PostResponse({
  required this.message,
  required this.id}
      );

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}

extension ModelMapper on PostResponse {
  ImagePost get entity => ImagePost(
    message: message,
    id: id,
  );
}