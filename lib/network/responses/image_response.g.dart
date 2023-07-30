// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyImage _$MyImageFromJson(Map<String, dynamic> json) => MyImage(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      imageId: json['imageId'] as String?,
      subId: json['subId'] as String?,
      createdAt: json['createdAt'] as String?,
      image: json['image'] == null
          ? null
          : MyImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyImageToJson(MyImage instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageId': instance.imageId,
      'subId': instance.subId,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };

MyImageModel _$MyImageModelFromJson(Map<String, dynamic> json) => MyImageModel(
      id: json['id'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MyImageModelToJson(MyImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
