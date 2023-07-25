
import 'package:architecture_sample/repositories/breeds_search_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../favourite/favourite_controller.dart';
import '../models/breeds_image.dart';


class ImageScroll extends StatefulWidget {
  const ImageScroll({super.key, required this.breedImage,});



  final List<BreedImage> breedImage;

  @override
  State<ImageScroll> createState() => _ImageScrollState();
}

class _ImageScrollState extends State<ImageScroll> {

  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: true,
            autoPlay: false,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
            ),
            items: widget.breedImage.map((e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Image.network(
                    e.url,
                    fit: BoxFit.cover,
                    errorBuilder: (context, o, _) =>
                    const Icon(
                      Icons.image_not_supported_outlined,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,

                      child: IconButton(
                          iconSize: 40,
                          onPressed: () { context.read<CatsWikiRepository>().postFavourite(e.id);
                            },
                          icon: const Icon(Icons.star_border),
                          color: Colors.yellowAccent,

                      ),
                  ),
                ],
              ),
            ),
          )
          .toList()
        ),
        const SizedBox(
          height: 15,
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: widget.breedImage.length,
  );
}


