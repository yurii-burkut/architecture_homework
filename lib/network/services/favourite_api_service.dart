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

  Future<List<Map<String, String>>> getFavourite () async {
    final response = await _client.get('/favourites', queryParameters: {
      'sub_id' : 'user'
    });
    final data = response.data as List<dynamic>;
    final urls = <Map<String, String>>[];
    print(data);
    /*final urls = data
        .map((item) => item['image']['url'] as String)
        .toList();*/
   //final urls = <String>[];
    for (var item in data) {
      if (item['image']['url'] == null || item['id'].toString() == null){
        continue;
      }
      else{
        final url = item['image']['url'].toString();
        final id = item['id'].toString();
        urls.add({'id': id, 'url': url});
      }
    }
    return urls;
  }

  Future<void> deleteFavourite (int id) async {
    final uri = Uri.parse('https://api.thecatapi.com/v1/favourites/$id');
    await _client.delete(uri.toString());
    /*await _client.delete('/favourites/:', queryParameters: {
      'favourite_id' : id
    });*/
  }
}