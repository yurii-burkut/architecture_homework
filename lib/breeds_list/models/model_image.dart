import 'package:equatable/equatable.dart';

import '../../network/responses/image_response.dart';

class MyImage  extends Equatable{
  int id;
  String? userId;
  String? imageId;
  String? subId;
  String? createdAt;
  MyImageModel? image;

  MyImage({
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


