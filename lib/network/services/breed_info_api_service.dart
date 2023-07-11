import 'package:dio/dio.dart';

import '../responses/breed_info_response.dart';

class BreedInfoApiService {
  BreedInfoApiService({required Dio client, required String breedId})
      : _client = client,
        _breedId = breedId;

  final Dio _client;
  final String _breedId;

  Future<BreedInfoResponse> getBreedsInfo() async {
    final response = await _client.get('/breeds/$_breedId');
    return BreedInfoResponse.fromJson(response.data);
  }
}
