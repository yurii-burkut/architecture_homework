import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../breeds_list/models/breed.dart';

class FavouritesImagesCats extends StatelessWidget{
  final Breed breed;

  const FavouritesImagesCats({
    super.key,
    required this.breed});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Улюблені фото')
        ),
        body: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
      children:
      [
        Image.network(
          breed.imageUrl!,
          errorBuilder: (context, o, _) => const Icon(
            Icons.image_not_supported_outlined,
          ),
        ),
      ],
      ),
      ),
      );
  }

}