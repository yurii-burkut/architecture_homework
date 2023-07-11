import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:dio/dio.dart';

import '../responses/breed_details_response.dart';
import '../responses/breed_images_response.dart';

class BreedsApiService {
  const BreedsApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<BreedResponse>> getBreeds() async {
    final response = await _client.get('/breeds');

    return (response.data as Iterable)
        .map((element) =>
            BreedResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<List<BreedImagesResponse>> getCatsImagesByBreed(String breedId) async {
    final response = await _client.get('/images/search?breed_ids=$breedId&limit=5');

    return (response.data as Iterable)
        .map((element) =>
        BreedImagesResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<BreedDetailsResponse> getBreedsDetails(String breedId) async {
    final response = await _client.get('/breeds/&breedId');

    return BreedDetailsResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
