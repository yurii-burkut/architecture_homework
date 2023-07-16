import 'package:dio/dio.dart';
import '../responses/breed_details_response.dart';

class BreedsDetailsApiService {
  const BreedsDetailsApiService({required Dio client}) : _client = client;

  final Dio _client;



  Future<BreedDetailsResponse> getBreedsDetails(String breedId) async {
    final response = await _client.get('/breeds/', queryParameters: {
      'breed_ids': breedId,
    });
    
    final List<dynamic> responseData = response.data;
    final Map<String, dynamic> data = responseData.isNotEmpty ? responseData.first : {};

    return BreedDetailsResponse.fromJson(data);
  }
}
