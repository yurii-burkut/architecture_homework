import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/breed.dart';

class BreedDetailsPage extends StatelessWidget {
  final Breed breed;

  const BreedDetailsPage({required this.breed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${breed.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Origin: ${breed.origin}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Temperament: ${breed.temperament}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${breed.description ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                if (breed.url != null) {
                  launch(breed.url!);
                }
              },
              child: Text(
                'URL: ${breed.url}',
                style: TextStyle(
                  fontSize: 18,
                  color: breed.url != null ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

