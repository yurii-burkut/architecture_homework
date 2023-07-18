import 'package:architecture_sample/network/responses/breed_details_response.dart';
import 'package:architecture_sample/network/responses/breed_images_response.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/breeds_details_api_service.dart';
import 'package:architecture_sample/network/services/breeds_image_api_service.dart';

import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import 'package:architecture_sample/network/services/country_code_api_service.dart';
import '../breeds_list/models/breed.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required BreedsDetailsApiService breedsDetailsApiService,
    required BreedsImageApiService breedsImageApiService,
    required FlagApiService flagApiService,
  })
      : _breedsApiService = breedsApiService,
        _breedsDetailsApiService = breedsDetailsApiService,
        _breedsImageApiService = breedsImageApiService,
        _flagApiService = flagApiService;

  final BreedsApiService _breedsApiService;
  final BreedsDetailsApiService _breedsDetailsApiService;
  final BreedsImageApiService _breedsImageApiService;
  final FlagApiService _flagApiService;

  Future<List<Breed>> loadBreeds() async => await _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
  );
  Future<BreedDetails> loadBreedsDetails(String breedId) async {
     return  await _breedsDetailsApiService.getBreedsDetails(breedId).then(
        (value) => value.entity);
  }

  Future<List<BreedImage>> loadBreedsImage(String breedId) async => await _breedsImageApiService.getCatsImagesByBreed(breedId).then(
          (value) => value.map((item) => item.entity).toList(),
  );

  Future<String> loadFlagImage(String countryCode) async => await _flagApiService.getFlag(countryCode);
}
