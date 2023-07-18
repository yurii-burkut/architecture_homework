import 'package:dio/dio.dart';

class FavoritesApiService {
  const FavoritesApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<void> addToFavorites(String itemId, List<String> images) async {
    final response = await _client.post('/favourites', data: {
      'item_id': itemId,
      'images': images,
    });
  }

  Future<List<FavoriteItem>> getFavorites() async {
    final response = await _client.get('/favourites');
    final rawList = response.data as List<dynamic>;
    return rawList.map((rawItem) => FavoriteItem.fromJson(rawItem)).toList();
  }
}

class FavoriteItem {
  final String itemId;
  final List<String> images;

  FavoriteItem({required this.itemId, required this.images});

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      itemId: json['item_id'] as String,
      images: (json['images'] as List<dynamic>).cast<String>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'images': images,
    };
  }
}
