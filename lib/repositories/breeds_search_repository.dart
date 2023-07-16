import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';

import '../breeds_list/models/breed.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
  })  : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );
  Future<List<String>> loadImages(String breedId) =>
      _imageApiService.getImagesByBreed(breedId);
}
