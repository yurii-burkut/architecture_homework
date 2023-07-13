import 'package:flutter/material.dart';

class BreedImagesPage extends StatelessWidget{
  const BreedImagesPage ({Key? key, required this.images}) : super(key: key);

  final List<String> images;
  @override
  Widget build(BuildContext context){

    return ListView.separated(
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
        itemBuilder: (context, index){
        return Image.network(
          images[index],
          errorBuilder: (context, o, _) => const Icon(
            Icons.image_not_supported_outlined,
          ),
        );
      });
  }
}