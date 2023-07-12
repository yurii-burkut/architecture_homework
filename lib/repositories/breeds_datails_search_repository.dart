import 'package:architecture_sample/breed_details/models/breed_details.dart';
import 'package:architecture_sample/network/services/breed_details_api_service.dart';

class BreedDetailsSearchRepository {
  const BreedDetailsSearchRepository({required BreedDetailsApiService breedDetailsApiService, })
      : _breedDetailsApiService = breedDetailsApiService;

  final BreedDetailsApiService _breedDetailsApiService;

  Future<BreedDetails> loadBreedDetails(String breedId) async {
    final breedDetailsResponse = await _breedDetailsApiService.getBreedDetails(breedId);
    return breedDetailsResponse.toBreedDetails();
  }
}
