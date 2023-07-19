import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreedsFavouritesPage extends StatelessWidget {
  const BreedsFavouritesPage({
    super.key,
    required this.favouritesImages,});

  final List<String> favouritesImages;

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
          appBar: AppBar(
              title: const Icon(Icons.star)
          ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(
                    favouritesImages[index],
                    errorBuilder: (context, o, _) => const Icon(
                      Icons.image_not_supported_outlined,
                    ),
                  ),
                  IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            Icons.delete),
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
            itemCount: favouritesImages.length,
          ),
    ),
      );
  }
}