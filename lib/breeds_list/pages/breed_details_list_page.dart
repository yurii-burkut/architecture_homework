import 'package:flutter/material.dart';
import '../../application/app_shell.dart';
import '../../favorites/widgets/favorite_button.dart';
import '../models/breed_details.dart';


class BreedDetailsListPage extends StatelessWidget {
  const BreedDetailsListPage({required this.breedDetails, Key? key}) : super(key: key);

  final BreedDetails breedDetails;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      subTitle: '/Breed Details',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breedDetails.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        breedDetails.imageUrl,
                        height: 250,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: FavoriteButton(
                          isFavorite: false, // Замініть на логіку відображення статусу улюбленого
                          onPressed: () {
                            // Додайте код для обробки натискання кнопки
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Weight',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '🐾 ${breedDetails.weight.imperial} lbs (${breedDetails.weight.metric} kg)',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Temperament',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  breedDetails.temperament,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Origin',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  breedDetails.origin,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  breedDetails.description,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Life Span',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  breedDetails.lifeSpan,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Indoor',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.indoor),
                Text(
                  'Lap',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.lap),
                Text(
                  'Adaptability',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.adaptability),
                Text(
                  'Affection Level',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.affectionLevel),
                Text(
                  'Child Friendly',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.childFriendly),
                Text(
                  'Cat Friendly',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.catFriendly),
                Text(
                  'Dog Friendly',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                _buildStarRating(breedDetails.dogFriendly),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(
        5,
            (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.orange,
        ),
      ),
    );
  }
}
