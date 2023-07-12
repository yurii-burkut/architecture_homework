
import 'package:dio/dio.dart';

//v1/images/search?limit=10&breed_ids=beng&include_breeds=false
class ImageApiService {
  const ImageApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<dynamic>> getImagesByBreed(String breedId, {int limit = 10}) async {
    final response = await _client.get('/images/search', queryParameters: {
      'limit':limit,
      'breed_ids': breedId,
      'include_breeds':false
    });

    return (response.data as Iterable).toList();
      //  .map((element) =>
      //  BreedResponse.fromJson(element as Map<String, dynamic>))
      //  .toList();
  }
}