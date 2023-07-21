import 'package:dio/dio.dart';

import '../responses/breed_favorites_response.dart';

class FavoritesApiService {
  FavoritesApiService({required Dio client}) : _client = client;
  final Dio _client;
  static const String subId = "5c27784e-e5c6-4544-ad99-e309fedeb057";

  Future<List<BreedFavoritesGetResponse>> getFavoriteBreeds() async {

    final response = await _client.get(
      '/favourites',
      queryParameters: {
        "sub_id": subId,
      },
    );
    return (response.data as Iterable)
        .map((element) =>
            BreedFavoritesGetResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<BreedFavoritesGetResponse> getFavoriteBreedById(
      int favouriteId) async {
    final response = await _client.get('/favourites/$favouriteId');
    return BreedFavoritesGetResponse.fromJson(response.data);
  }

  Future<BreedFavoritesPostResponse> postFavoriteBreedById(
      String imageId) async {
    final response = await _client.post(
      '/favourites',
      data: {"image_id": imageId, "sub_id": subId},
    );
    return BreedFavoritesPostResponse.fromJson(response.data);
  }

  Future<String> deleteFavoriteBreed(int favoriteId) async {
    final response = await _client.delete('/favourites/$favoriteId');
    return response.data['massage'].toString();
  }
}
