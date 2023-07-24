import 'package:flutter/material.dart';
import 'package:architecture_sample/breeds_list/controller/favorites_controller.dart';
import 'package:provider/provider.dart';

class BreedImagesPage extends StatefulWidget {
  const BreedImagesPage({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  _BreedImagesPageState createState() => _BreedImagesPageState();
}

class _BreedImagesPageState extends State<BreedImagesPage> {
  @override
  Widget build(BuildContext context) {
    final favoritesController = context.watch<FavoritesController>();

    bool isFavorite(String imageUrl) {
      return favoritesController.isFavorite(imageUrl);
    }

    void toggleFavorite(String imageUrl) {
      favoritesController.toggleFavorite(imageUrl);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Breed Images'),
      ),
      body: ListView.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          final imageUrl = widget.images[index];

          return Column(
            children: [
              Image.network(
                imageUrl,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite(imageUrl) ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite(imageUrl) ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  toggleFavorite(imageUrl);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
