import 'package:flutter/material.dart';

import '../breeds_list_controller.dart';

class BreedImagesPage extends StatelessWidget {
  const BreedImagesPage({
    Key? key,
    required this.images,
    required this.controller,
  }) : super(key: key);

  final List<Map<String, String>> images;
  final BreedsListController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breed Images'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.separated(
        separatorBuilder: (context, _) => const SizedBox(
          height: 24,
          child: Center(
            child: Icon(
              Icons.more_horiz,
              size: 24,
            ),
          ),
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                images[index]['url']!,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await controller
                          .sendFavouritesImages(images[index]['id']!);
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
