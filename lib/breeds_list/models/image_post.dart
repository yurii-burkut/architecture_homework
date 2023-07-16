import 'package:equatable/equatable.dart';

class ImagePost extends Equatable{
  final String message;
  final int id;

  const ImagePost({
    required this.message,
    required this.id
  });


  @override
  List<Object?> get props => [message,id,];
}