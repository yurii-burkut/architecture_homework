import 'package:dio/dio.dart';

import '../responses/breed_details_response.dart';

class BreedDetailsApiService {
  const BreedDetailsApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<BreedDetailsResponse> getBreedDetails(String breedId) async {
    final response = await _client.get('/breeds/$breedId');
    return BreedDetailsResponse.fromJson(response.data);
  }
}