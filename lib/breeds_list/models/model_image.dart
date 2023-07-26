import 'package:equatable/equatable.dart';

import '../../network/responses/image_response.dart';

class MyImage  extends Equatable{
 final int id;
 final String? userId;
 final String? imageId;
 final String? subId;
 final String? createdAt;
 final MyImageModel? image;

  const MyImage({
    required this.id,
    this.userId,
    this.imageId,
    this.subId,
    this.createdAt,
    this.image,
  });


  @override

  List<Object?> get props => [id, userId, imageId, createdAt, image];
}


