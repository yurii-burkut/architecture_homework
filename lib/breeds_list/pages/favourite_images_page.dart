import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/breeds_search_repository.dart';
import '../breeds_list_controller.dart';


class FavouriteImagesPage extends StatelessWidget {
  const FavouriteImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          BreedsListController(
            repository: context.read<CatsWikiRepository>(),
          ),
      child: FavouriteImageWidget(),
    );
  }
}

class FavouriteImageWidget extends StatelessWidget {
  //const FavouriteImageWidget ({Key? key, required this.images, required this.controller}) : super(key: key);
  late final List<String> images;
  late final BreedsListController controller;

  @override
  Widget build(BuildContext context){
    final controller = Provider.of<BreedsListController>(context, listen: false);
    return FutureBuilder<List<String>>(
      future: controller.findFavImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final images = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, _) =>
                Container(
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
            itemBuilder: (context, index) {
              return Stack(
                  children: [
                    Image.network(
                      images[index],
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
                            },
                            child: Text('delete'),
                          ),
                        )
                    )
                  ]
              );
            },
          );
        } else {
          return Center(child: Text('No images'));
        }
      },
    );
  }
}