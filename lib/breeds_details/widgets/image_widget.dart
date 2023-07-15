import 'package:flutter/material.dart';

import '../models/breeds_image.dart';


class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.breedImage, });

  final List<BreedImage> breedImage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: breedImage.length,
      itemBuilder: (context, index) => Image.network(
        breedImage.first.url,
        errorBuilder: (context, o, _) => const Icon(
          Icons.image_not_supported_outlined,
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
