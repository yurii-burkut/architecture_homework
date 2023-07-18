import 'package:flutter/material.dart';

class BreedImagesPage extends StatefulWidget {
  const BreedImagesPage({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  _BreedImagesPageState createState() => _BreedImagesPageState();
}

class _BreedImagesPageState extends State<BreedImagesPage> {
  List<String> favoriteImages = [];

  bool isFavorite(String imageUrl) {
    return favoriteImages.contains(imageUrl);
  }

  void toggleFavorite(String imageUrl) {
    setState(() {
      if (isFavorite(imageUrl)) {
        favoriteImages.remove(imageUrl);
      } else {
        favoriteImages.add(imageUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breed Images'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, _) => Container(
          height: 24,
          child: const Center(
            child: Icon(
              Icons.more_horiz,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
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
