import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:flutter/material.dart';

import '../../breed_info/breed_info_page.dart';
import 'favorite_icon_buton.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({required this.breed, Key? key, this.onPressed})
      : super(key: key);

  final Breed breed;
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreedInfoPage(
                        breedId: breed.id,
                        imageUrl: '${breed.imageUrl}',
                      ),
                    ),
                  );
                },
                child: Image.network(
                  breed.imageUrl!,
                  errorBuilder: (context, o, _) => const Icon(
                    Icons.image_not_supported_outlined,
                  ),
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
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.share),
                  ),
                FavoriteIconButton(imageId: breed.referenceImageId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
