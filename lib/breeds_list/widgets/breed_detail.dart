import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:architecture_sample/breeds_list/widgets/webview_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../network/services/favorite_image_api_service.dart';

class BreedDetail extends StatefulWidget {
  const BreedDetail({Key? key, required this.breed, required this.images})
      : super(key: key);

  final Breed breed;
  final List<String> images;

  @override
  State<BreedDetail> createState() => _BreedDetailState();
}

class _BreedDetailState extends State<BreedDetail> {
  List<bool> isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    isFavoriteList = List<bool>.filled(widget.images.length, false);
  }

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
              widget.breed.name,
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
                itemCount: widget.images.length,
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
                                widget.images[index],
                                errorBuilder: (context, o, _) => const Icon(
                                  Icons.image_not_supported_outlined,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavoriteList[index] = !isFavoriteList[index];
                                    });

                                    final favoriteImageApiService =
                                        Provider.of<FavoriteImageApiService>(
                                            context,
                                            listen: false);
                                    favoriteImageApiService.addFavoriteImage(
                                        widget.images[index], "RusPal_123");
                                  },
                                  icon: Icon(
                                    isFavoriteList[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                  ),
                                ),
                                const Text(
                                  'Add to favorites',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
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
                Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
            ...buildText("Temperament", widget.breed.temperament),
            ...buildText("Origin", widget.breed.origin),
            ...buildText("Description", widget.breed.description),
            ...buildText("Life span", '${widget.breed.life_span} years'),
            ...buildText("Weight in metric", '${widget.breed.metric} kg.'),
            const SizedBox(height: 24),
            WebViewButton(
              breed: widget.breed,
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
