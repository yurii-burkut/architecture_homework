import 'package:dio/dio.dart';

class ImageApiService {
  const ImageApiService({required Dio client}) : _client = client;

  final Dio _client;

  //{{endpoint}}v1/image/search?limit=1-&breed_ids=abys&include_breeds=fases
  Future<List<String>> getImagesByBreed(String breedId,
      {int limit = 10}) async {
    final response = await _client.get('/images/search', queryParameters: {
      'limit': limit,
      'breed_ids': breedId,
      'include_breeds': false
    });

    final rawIterable =
        (response.data as List<dynamic>).cast<Map<String, dynamic>>();
    return rawIterable.map((e) => e['url'] as String).toList();
    //.map((element) =>
    //  BreedResponse.fromJson(element as Map<String, dynamic>))
    //.toList();
  }
}
