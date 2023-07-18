import 'package:dio/dio.dart';
import '../responses/breed_details_response.dart';

class BreedsDetailsApiService {
  const BreedsDetailsApiService({required Dio client}) : _client = client;

  final Dio _client;



  Future<BreedDetailsResponse> getBreedsDetails(String breedId) async {
    final response = await _client.get('/breeds/$breedId');
    
    final Map<String, dynamic> responseData = response.data;

    return BreedDetailsResponse.fromJson(responseData);
  }
}
