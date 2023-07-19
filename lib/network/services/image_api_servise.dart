import 'package:dio/dio.dart';

class ImageApiService {
  const ImageApiService
  ({required Dio client}) : _client = client;

final Dio _client;

Future<List<String>> getImageByBreed(String breedId, {int limit = 10}) async {
  final response = await _client.get('/images/search', queryParameters: {
    'limit': limit,
    'breed_ids': breedId,
    'include_breeds': false
  });

  final rawIterable = (response.data as List<dynamic>).cast<Map<String, dynamic>>();
  return rawIterable.map((e) => e['url'] as String).toList();
}

  Future<List<String>?> sendPostRequestOnImage(imageId) async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      Response response = await dio.post(
        'https://api.thecatapi.com/v1/favourites',
        data: {'image_id': '$imageId}',
          'sub_id': 'vasiliyRich'},
      );

      print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');

      final rawIterable = (response.data as List<dynamic>).cast<Map<String, dynamic>>();
      return rawIterable.map((e) => e['id'] as String).toList();
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }
}