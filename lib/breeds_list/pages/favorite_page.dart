import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:architecture_sample/breeds_list/controller/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesController = context.watch<FavoritesController>();

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: favoritesController.favoriteImages.length,
        itemBuilder: (context, index) {
          final imageUrl = favoritesController.favoriteImages[index];
          return ListTile(
            title: ExcludeSemantics(
              child: Column(
                children: [
                  Image.network(imageUrl),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      favoritesController.removeFavoriteImage(imageUrl);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
