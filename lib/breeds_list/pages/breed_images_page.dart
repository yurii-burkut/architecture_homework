import 'package:flutter/material.dart';
import '../breeds_list_controller.dart';

class BreedImagesPage extends StatelessWidget{
  const BreedImagesPage ({Key? key, required this.images, required this.controller}) : super(key: key);
  final List<Map<String, String>> images;
  final BreedsListController controller;
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
        return Stack(
          children: [
            Image.network(
              images[index]['url']!,
              errorBuilder: (context, o, _) => const Icon(
                Icons.image_not_supported_outlined,
                ),
              ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    print('okay, its work');
                    print('images[id] - ' + images[index]['id']!);
                    await controller.sendFavouriteImage(images[index]['id']!);
                  },
                  child: Text('Like'),
                ),
              )
            )
          ]
        );
      });
  }
}

