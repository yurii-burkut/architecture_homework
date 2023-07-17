import 'package:dio/dio.dart';

class FavoriteImageApiService {
  final Dio _client;
  final String? _subId;

  FavoriteImageApiService({required Dio client, String? subId})
      : _client = client,
        _subId = subId;

  Future<List<String>> getFavoriteImages() async {
    final response = await _client.get('/favorite/images');

    final rawIterable = (response.data as List<dynamic>).cast<Map<String, dynamic>>();
    return rawIterable.map((e) => e['url'] as String).toList();
  }

  Future<void> removeFromFavorites(int favoriteId) async {
    await _client.delete('/favourites/$favoriteId');
  }

  Future<void> addToFavorites(Map<String, dynamic> requestBody) async {
    await _client.post('/favourites', data: requestBody);
  }
}
