import 'package:dio/dio.dart';
import '../responses/breed_images_response.dart';

class BreedsImageApiService {
  const BreedsImageApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<BreedImagesResponse>> getCatsImagesByBreed(String breedId) async {
    final response = await _client.get('/images/search?breed_ids=$breedId&limit=5');

    return (response.data as Iterable)
        .map((element) =>
        BreedImagesResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }
}
