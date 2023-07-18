import 'package:dio/dio.dart';
class FavouriteApiService{
  const FavouriteApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<void> postFavourite (String imageId) async {
    await _client.post(
      '/favourites',
      data: {
        'image_id': imageId,
        'sub_id': 'user',
      },
    );
    //final data = response.data as List<dynamic>;
    //final ids = data.map((item) => item['id'] as int).toList();

    //return ids;
  }

  Future<List<String>> getFavourite () async {
    final response = await _client.get('/favourites', queryParameters: {
      'sub_id' : 'user'
    });

    final data = response.data as List<dynamic>;
    final urls = data
        .map((item) => item['image']['url'] as String)
        .toList();
    return urls;
  }

  /*Future<void> deleteFavourite (int id) async {
    await _client.delete('/favourites/:favourite_id', queryParameters: {
      'favourite_id' : id
    });
  }*/
}