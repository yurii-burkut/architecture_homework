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
}
