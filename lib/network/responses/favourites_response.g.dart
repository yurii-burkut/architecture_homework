// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouritesResponse _$FavouritesResponseFromJson(Map<String, dynamic> json) =>
    FavouritesResponse(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      imageId: json['imageId'] as String?,
      subId: json['subId'] as String?,
      createdAt: json['createdAt'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouritesResponseToJson(FavouritesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageId': instance.imageId,
      'subId': instance.subId,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
