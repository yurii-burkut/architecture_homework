import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../breeds_list/models/breed.dart';

class BreedInfo extends StatelessWidget{
  final Breed breed;

  const BreedInfo({super.key,
    required this.breed});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (breed.imageUrl != null)
              Image.network(
                breed.imageUrl!,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
            const SizedBox(height: 8.0),
            Text(
              breed.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
                Text('Origin: ${breed.origin}'),
                //if (breed.url != null)
                  // IconButton(
                  //   onPressed: onPressed,
                  //   icon: Icon(Icons.share),
                  // ),



          ],
        ),
      ),
    );
  }
  }