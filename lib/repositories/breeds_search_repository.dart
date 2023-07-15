import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/breeds_list/models/breed.dart';

import '../breeds_list/models/breed_details.dart';
import '../network/services/breed_details_api_service.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
    required BreedDetailsApiService breedDetailsApiService,
  })  : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService,
        _breedDetailsApiService = breedDetailsApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final BreedDetailsApiService _breedDetailsApiService;

  Future<List<Breed>> loadBreeds() async {
    final breedResponses = await _breedsApiService.getBreeds();
    return breedResponses.map((response) => response.entity).toList();
  }

  Future<List<String>> loadImages(String breedId) async {
    final images = await _imageApiService.getImagesByBreed(breedId);
    return images.cast<String>();
  }

  Future<BreedDetails> loadBreedDetails(String breedId) async {
    final breedDetailsResponse = await _breedDetailsApiService.getBreedDetails(breedId);
    return breedDetailsResponse.toBreedDetails();
  }

}
