import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:architecture_sample/breeds_list/widgets/webview_button.dart';
import 'package:flutter/material.dart';

class BreedDetail extends StatelessWidget {
  const BreedDetail({Key? key, required this.breed}) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Breed details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text(
              breed.name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 24),
            if (breed.imageUrl != null)
              Image.network(
                breed.imageUrl!,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
            ...buildText("Temperament", breed.temperament),
            ...buildText("Origin", breed.origin),
            ...buildText("Description", breed.description),
            ...buildText("Life span", breed.life_span + ' years'),
            ...buildText("Weight in metric", breed.metric + ' kg.'),
            const SizedBox(height: 24),
            WebViewButton(
              breed: breed,
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      const SizedBox(height: 28),
      Text(text,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey)),
      const SizedBox(height: 8),
      Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    ];
  }
}
