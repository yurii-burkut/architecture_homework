import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/screens/breed_info.dart';
import '../breeds_list_controller.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({required this.breed, Key? key, this.onPressed, required this.favouritesImages})
      : super(key: key);

  final Breed breed;
  final List<String> favouritesImages;
  final VoidCallback? onPressed;

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
            Row(
              children: [
                Text('Origin: ${breed.origin}'),
                if (breed.url != null)
                  GestureDetector(
                    child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.photo_camera),
                    ),
                  ),
                const Text('Add in'),
                IconButton(
                  onPressed: (){
                    context.read<BreedsListController>().addFavouritesImages(breed.referenceImageId);
                  },
                  icon: const Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () {                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      BreedInfo(breed: breed,)
                      ),
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                ),
          ],
        ),
      ],
    ),
    )
    );
  }
}
