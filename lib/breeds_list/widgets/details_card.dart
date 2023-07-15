import 'package:flutter/material.dart';
import 'package:architecture_sample/breeds_list/models/breed_details.dart';

class BreedDetailsCard extends StatelessWidget {
  const BreedDetailsCard({required this.breedDetails, Key? key, this.onPressed})
      : super(key: key);

  final BreedDetails breedDetails;
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
            const SizedBox(height: 8.0),
            Text(
              breedDetails.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Origin: ${breedDetails.origin}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Description: ${breedDetails.description}',
            ),
            const SizedBox(height: 8.0),
            if (breedDetails.temperament.isNotEmpty)
              Text(
                'Temperament: ${breedDetails.temperament}',
              ),
            const SizedBox(height: 8.0),
            if (breedDetails.lifeSpan.isNotEmpty)
              Text(
                'Life Span: ${breedDetails.lifeSpan}',
              ),
            const SizedBox(height: 8.0),
            if (breedDetails.wikipediaUrl != null)
              TextButton(
                onPressed: onPressed,
                child: const Text('More Details'),
              ),
          ],
        ),
      ),
    );
  }
}
