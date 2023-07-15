import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:dio/dio.dart';

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
  // Future<List<BreedResponse>> getPhotos(String id) async {
  //   const _apiKey = 'live_n4d5FPV0uY0Br4loCo13WbraocoWtDv8jm3zlqw4iCvmShOAuxT9NDHeaUwYcEoB';
  //   final response = await _client.get(
  //       '/images/search?breed_ids=$id&limit=10&api_key=$_apiKey');
  //
  //   return (response.data as Iterable)
  //       .map((element) =>
  //       BreedResponse.fromJson(element as Map<String, dynamic>))
  //       .toList();
  // }
}

