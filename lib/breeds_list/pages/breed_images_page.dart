import 'package:flutter/material.dart';

class BreedImagesPage extends StatelessWidget {
  const BreedImagesPage({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            errorBuilder: (context, o, _) => const Icon(
              Icons.image_not_supported,
            ),
          );
        },
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
        itemCount: images.length);
  }
}
