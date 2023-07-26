import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/breeds_search_repository.dart';
import '../breeds_list_controller.dart';

class FavouritesImagesPage extends StatelessWidget {
  const FavouritesImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BreedsListController(
        repository: context.read<CatsWikiRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Images'),
          backgroundColor: Colors.black87,
        ),
        body: const FavouritesImagesWidget(),
      ),
    );
  }
}

class FavouritesImagesWidget extends StatelessWidget {
  const FavouritesImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: _fetchFavouriteImages(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final images = snapshot.data!;
          return ListView.separated(
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
              return FavouriteImageItem(
                imageUrl: images[index]['url']!,
                onDelete: () async {
                  final id = int.parse(images[index]['id']!);
                  final controller =
                      Provider.of<BreedsListController>(context, listen: false);
                  await controller.deleteFavouritesImages(id);
                },
              );
            },
          );
        } else {
          return const Center(child: Text('Favourites Images'));
        }
      },
    );
  }

  Future<List<Map<String, String>>> _fetchFavouriteImages(
      BuildContext context) async {
    final controller =
        Provider.of<BreedsListController>(context, listen: false);
    return controller.findFavouritesImages();
  }
}

class FavouriteImageItem extends StatelessWidget {
  const FavouriteImageItem({
    Key? key,
    required this.imageUrl,
    required this.onDelete,
  }) : super(key: key);

  final String imageUrl;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          imageUrl,
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
              onTap: onDelete,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.25),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.orange,
                  size: 36,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
