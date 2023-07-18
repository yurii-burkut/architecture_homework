import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/screens/favourites_image.dart';
import '../../network/services/favourites_api.dart';
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
                      icon: Icon(Icons.share),
                    ),
                  ),
                Text('Add in'),
                IconButton(
                  onPressed: () async {
                    final controller = context.read<BreedsListController>();
                    await controller.findFavouritesImages()
                        .then((images) => controller.openFavouritesImages (favouritesImages.cast<String>(), context));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>
                  //       BreedsFavouritesPage(favouritesImages: favouritesImages)
                  //   ),
                  // );
                  },
                  icon: Icon(Icons.star_border),
                ),
          ],
        ),
      ],
    ),
    )
    );
  }
}
