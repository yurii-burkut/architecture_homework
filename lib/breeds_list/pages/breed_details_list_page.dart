import 'package:flutter/material.dart';
import '../../application/app_shell.dart';
import '../models/breed_details.dart';

class BreedDetailsListPage extends StatelessWidget {
  const BreedDetailsListPage({required this.breedDetails, Key? key}) : super(key: key);

  final BreedDetails breedDetails;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      subTitle: 'Breed Details',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                breedDetails.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              if (breedDetails.imageUrl != null) // Відображення фото, якщо воно є
                Image.network(
                  breedDetails.imageUrl!,
                  height: 200, // Налаштуйте висоту за потребою
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 8.0),
              Text('Weight: ${breedDetails.weight.imperial} lbs (${breedDetails.weight.metric} kg)'),
              Text('Temperament: ${breedDetails.temperament}'),
              Text('Origin: ${breedDetails.origin}'),
              Text('Description: ${breedDetails.description}'),
              Text('Life Span: ${breedDetails.lifeSpan}'),
              Text('Indoor: ${breedDetails.indoor.toString()}'),
              Text('Lap: ${breedDetails.lap.toString()}'),
              Text('Adaptability: ${breedDetails.adaptability.toString()}'),
              Text('Affection Level: ${breedDetails.affectionLevel.toString()}'),
              Text('Child Friendly: ${breedDetails.childFriendly.toString()}'),
              Text('Cat Friendly: ${breedDetails.catFriendly.toString()}'),
              Text('Dog Friendly: ${breedDetails.dogFriendly.toString()}'),
              // add more
            ],
          ),
        ),
      ),
    );
  }
}
