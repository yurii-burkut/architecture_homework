import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/breeds_list/models/breed.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
  })  : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;

  Future<List<Breed>> loadBreeds() async {
    final breedResponses = await _breedsApiService.getBreeds();
    return breedResponses.map((response) => response.entity).toList();
  }

  Future<List<String>> loadImages(String breedId) async {
    final images = await _imageApiService.getImagesByBreed(breedId);
    return images.cast<String>();
  }
}
