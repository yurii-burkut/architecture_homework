import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../breeds_list/models/breed.dart';

class AlbumBreeds extends StatelessWidget{
  final Breed breed;

  const AlbumBreeds({super.key,
    required this.breed});
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Icon(Icons.photo_camera)
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                //color: Colors.blue,
                child: Center(child: Image.network(
                  breed.imageUrl!,
              //     errorBuilder: (context, o, _) => const Icon(
              //   Icons.image_not_supported_outlined,
              // ),
              ),
              ),
              );
            }
        ),
      ),
    );
  }
}