import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:architecture_sample/network/dio_client.dart';

import 'package:architecture_sample/network/services/favorite_api_service.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesApiService = FavoritesApiService(client: DioClient.instance);

    return FutureBuilder<List<FavoriteItem>>(
      future: favoritesApiService.getFavorites(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching favorites'));
        } else {
          final favorites = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(title: Text('Favorites')),
            body: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(favorites[index].itemId),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: favorites[index].images
                      .map((url) => Image.network(url))
                      .toList(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
