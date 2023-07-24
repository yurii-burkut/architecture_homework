import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreedsImagesPage extends StatelessWidget {
  const BreedsImagesPage({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  images[index],
                  errorBuilder: (context, o, _) => const Icon(
                    Icons.image_not_supported_outlined,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: add delete action here
                      },
                      icon: const Icon(
                        Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: add favourites action here
                      },
                      icon: const Icon(
                        Icons.star,
                      ),
                    ),
                  ],
                ),
              ],
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
          itemCount: images.length,
        ),
      ),
    );
  }
}
