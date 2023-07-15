import 'package:architecture_sample/network/responses/breed_details_response.dart';
import 'package:architecture_sample/network/responses/breed_images_response.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/breeds_details_api_service.dart';
import 'package:architecture_sample/network/services/breeds_image_api_service.dart';

import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import '../breeds_list/models/breed.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required BreedsDetailsApiService breedsDetailsApiService,
    required BreedsImageApiService breedsImageApiService,
  })
      : _breedsApiService = breedsApiService,
        _breedsDetailsApiService = breedsDetailsApiService,
        _breedsImageApiService = breedsImageApiService;

  final BreedsApiService _breedsApiService;
  final BreedsDetailsApiService _breedsDetailsApiService;
  final BreedsImageApiService _breedsImageApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
  );
  Future<BreedDetails> loadBreedsDetails(String breedId) => _breedsDetailsApiService.getBreedsDetails(breedId).then(
        (value) => value.entity);

  Future<List<BreedImage>> loadBreedsImage(String breedId) => _breedsImageApiService.getCatsImagesByBreed(breedId).then(
          (value) => value.map((item) => item.entity).toList(),
  );
}
