import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:architecture_sample/breeds_list/widgets/webview_button.dart';
import 'package:flutter/material.dart';

class BreedDetail extends StatelessWidget {
  const BreedDetail({Key? key, required this.breed, required this.images})
      : super(key: key);

  final Breed breed;
  final List<String> images;

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
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.network(
                                images[index],
                                errorBuilder: (context, o, _) => const Icon(
                                  Icons.image_not_supported_outlined,
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                //SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                                                      },
                                  icon: const Icon(Icons.favorite_border, size: 30,),
                                ),
                                //SizedBox(width: 10),
                                const Text('Add to favorites', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios, color: Colors.white),
                SizedBox(width: 150),
                Icon(Icons.arrow_forward_ios,  color: Colors.white),
              ],
            ),
            ...buildText("Temperament", breed.temperament),
            ...buildText("Origin", breed.origin),
            ...buildText("Description", breed.description),
            ...buildText("Life span", '${breed.life_span} years'),
            ...buildText("Weight in metric", '${breed.metric} kg.'),
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
