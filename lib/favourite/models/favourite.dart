import 'package:equatable/equatable.dart';

class Favourite extends Equatable {
  const Favourite({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.image,

  });

  final String id;
  final String userId;
  final String imageId;
  final String subId;
  final ImageUrl image;

  @override
  List<Object?> get props => [id, userId, imageId, subId, image];
}

class ImageUrl {
  const ImageUrl ({
    required this.url,
  });

  final String url;

  @override
  List<Object?> get props => [url];

}