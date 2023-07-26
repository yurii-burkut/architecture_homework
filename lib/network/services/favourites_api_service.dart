import 'package:dio/dio.dart';

class FavouritesApiService {
  const FavouritesApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<void> postFavourite(String imageId) async {
    await _client.post(
      '/favourites',
      data: {
        'image_id': imageId,
        'sub_id': 'user',
      },
    );
  }

  Future<List<Map<String, String>>> getFavourite() async {
    final response =
        await _client.get('/favourites', queryParameters: {'sub_id': 'user'});
    final data = response.data as List<dynamic>;

    final urls = data
        .where((item) => item['image']['url'] != null)
        .map<Map<String, String>>((item) {
      final url = item['image']['url'].toString();
      final id = item['id'].toString();
      return {'id': id, 'url': url};
    }).toList();

    return urls;
  }

  Future<void> deleteFavourite(int id) async {
    final uri = Uri.parse('https://api.thecatapi.com/v1/favourites/$id');
    await _client.delete(uri.toString());
  }
}
