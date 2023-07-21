import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list_controller.dart';

class FavoritesImagesPage extends StatelessWidget {
  const FavoritesImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('About Cats'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ValueListenableBuilder(
              valueListenable:
                  context.read<BreedsListController>().loadingStatusFavorites,
              builder: ((context, value, child) {
                switch (value) {
                  case LoadingStatus.loading:
                    return const _Favoritesloading();
                  case LoadingStatus.completed:
                    return const _FavoritesLoaded();
                  case LoadingStatus.error:
                    return const _FavoritesLoadingError();
                }
              })),
        ),
      ),
    );
  }
}

class _Favoritesloading extends StatelessWidget {
  const _Favoritesloading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

class _FavoritesLoaded extends StatelessWidget {
  const _FavoritesLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = context.read<BreedsListController>().favoritesImages.value;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Image.network(
            images[index].url,
            errorBuilder: (context, o, _) => const Icon(
              Icons.image_not_supported,
            ),
          );
        },
        separatorBuilder: (context, _) => SizedBox(
              height: 24,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.delete,
                    size: 24,
                    color: Colors.white,),
                  onPressed: (){
                    context.read<BreedsListController>().deleteFavorite(images[_].id);
                  },
                ),
              ),
            ),
        itemCount: images.length);
  }
}

class _FavoritesLoadingError extends StatelessWidget {
  const _FavoritesLoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.warning_amber_outlined, color: Colors.red),
        const Text('Oops, something went wrong!'),
        ElevatedButton(
          onPressed: () {
            context.read<BreedsListController>().loadFavoriteImagesUrls();
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
