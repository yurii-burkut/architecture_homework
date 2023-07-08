import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:dio/dio.dart';

class BreedInfoApiService {
  const BreedInfoApiService({required Dio client, required String breedId}) : _client = client, _breedId = breedId;

  final Dio _client;
  final String _breedId;

  Future<List<BreedResponse>> getBreeds() async {
    final response = await _client.get('/breeds/${_breedId}');

    return (response.data as Iterable)
        .map((element) =>
        BreedResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }
}
