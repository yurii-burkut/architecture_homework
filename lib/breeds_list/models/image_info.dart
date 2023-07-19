
import 'package:equatable/equatable.dart';

class FavouritesImageInfo extends Equatable {
  int? id;
  String? imageURL;

  FavouritesImageInfo({this.id, this.imageURL});

  @override

  List<Object?> get props => [id, imageURL];
}