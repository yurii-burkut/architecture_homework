import 'package:flutter/material.dart';
import '../../application/app_shell.dart';
import '../../favorites/widgets/favorite_button.dart';

class FavoriteImagesPage extends StatelessWidget {
  const FavoriteImagesPage({Key? key, required this.favoriteImages}) : super(key: key);

  final List<String> favoriteImages;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      subTitle: ' / Favorites',
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  favoriteImages[index],
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: FavoriteButton(
                    isFavorite: false,
                    onPressed: () {
                      // Логіка при натисканні на кнопку улюбленого
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
