import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites_controller.dart';
import '../favorites/pages/favorite_images_page.dart';

class AppShell extends StatelessWidget {
  const AppShell({Key? key, required this.child, this.subTitle}) : super(key: key);

  final Widget child;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cats Wiki'),
            if (subTitle != null) Text(subTitle!),
          ],
        ),
        centerTitle: true,
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoriteImagesPage(
                  favoritesController: Provider.of<FavoritesController>(context, listen: false),
                ),
              ),
            );
          } else if (index == 1) {
            //  "Search"
          }
        },
      ),
    );
  }
}
