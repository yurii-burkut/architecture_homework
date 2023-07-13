import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:dio/dio.dart';

import '../responses/breed_info_response.dart';

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
  Future<BreedInfoResponse> getBreedsInfo(String breedId) async {
    final response = await _client.get('/breeds/$breedId');
    return BreedInfoResponse.fromJson(response.data);
  }
}
