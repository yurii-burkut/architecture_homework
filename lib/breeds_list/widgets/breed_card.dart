import 'package:flutter/material.dart';
import '../../favorites/widgets/favorite_button.dart';
import '../models/breed.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({
    required this.breed,
    required this.onPressedShare,
    required this.onPressedPhoto,
    required this.onPressedMoreDetails,
    Key? key,
  }) : super(key: key);

  final Breed breed;
  final void Function() onPressedShare;
  final void Function() onPressedPhoto;
  final void Function() onPressedMoreDetails;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Розміщення кнопки улюблена на правому краю
              children: [
                Text(
                  breed.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FavoriteButton(
                  isFavorite: false, // Змініть значення на потрібний, використовуйте дане значення або інший спосіб отримання значення улюбленого стану
                  onPressed: () {
                    // Логіка при натисканні на кнопку улюблена
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            if (breed.imageUrl != null)
              Image.network(
                breed.imageUrl!,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    breed.origin,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    onPressed: onPressedShare,
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: onPressedPhoto,
                    icon: const Icon(Icons.photo),
                  ),
                  GestureDetector(
                    onTap: onPressedMoreDetails,
                    child: const Text(
                      'More Details',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
