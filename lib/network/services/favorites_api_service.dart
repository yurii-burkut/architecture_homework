import 'package:dio/dio.dart';

import '../responses/breed_favorites_response.dart';

class FavoritesApiService {
  FavoritesApiService({required Dio client}) : _client = client;
  final Dio _client;
  static const String subId = '5c27784e-e5c6-4544-ad99-e309fedeb057';

  Future<List<BreedFavoritesGetResponse>> getFavoriteBreeds() async {
    final response = await _client.get('/favorites', queryParameters: {
      'sub_id': subId,
    });
    return (response.data as Iterable)
        .map((element) =>
        BreedFavoritesGetResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<BreedFavoritesGetResponse> getFavoriteBreedById(String favourite_id) async {
    final response = await _client.get('/favorites/:$favourite_id');
    return BreedFavoritesGetResponse.fromJson(response.data);
  }

  Future<BreedFavoritesPostResponse> postFavoriteBreedById(String image_id) async {
    final response = await _client.post('/favorites', data: {
      'image_id': image_id,
      'sub_id': subId,
    });
    return BreedFavoritesPostResponse.fromJson(response.data);
  }

  Future<void> deleteFavoriteBreed(String favorite_id) async {
    await _client.delete('/favorites/:$favorite_id');
  }

}
