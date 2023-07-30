
import 'package:dio/dio.dart';


class FavoriteImageApiService {
  final Dio _client;

  FavoriteImageApiService({required Dio client}) : _client = client;

  Future<List<Map<String, dynamic>>> getFavoriteImages() async {
    final response = await _client.get('/favourites');

    return List<Map<String, dynamic>>.from(response.data);
  }


  Future<void> removeFromFavorites(int? favoriteId) async {
    await _client.delete('/favourites/$favoriteId');
  }

  Future<void> addToFavorites(String imageId, {String? subId}) async {
    final requestBody = {
      'image_id': imageId,
      'sub_id': subId,
    };

    await _client.post(
      '/favourites',
      data: requestBody,
    );
  }
}