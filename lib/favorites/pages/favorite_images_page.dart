import 'package:flutter/material.dart';
import '../favorites_controller.dart';
import '../widgets/favorite_button.dart';

class FavoriteImagesPage extends StatelessWidget {
  const FavoriteImagesPage({Key? key, required this.favoritesController}) : super(key: key);

  final FavoritesController favoritesController;

  @override
  Widget build(BuildContext context) {
    final favoriteImages = favoritesController.favoriteImagesListenable.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(' / Favorites'),
      ),
      body: favoriteImages.isEmpty
          ? Center(
        child: Text('Немає улюблених зображень'),
      )
          : ListView.separated(
        itemBuilder: (context, index) {
          final imageUrl = favoriteImages[index];

          return Container(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: FavoriteButton(
                    isFavorite: favoritesController.isImageFavorite(imageUrl),
                    onPressed: () {
                      // Видалення фото з улюблених
                      final favoriteId = favoritesController.getFavoriteId(imageUrl);
                      if (favoriteId != null) {
                        favoritesController.removeFromFavorites(favoriteId);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 24),
        itemCount: favoriteImages.length,
      ),
    );
  }
}
