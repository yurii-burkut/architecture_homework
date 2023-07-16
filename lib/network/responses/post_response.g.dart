// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      message: json['message'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
    };
