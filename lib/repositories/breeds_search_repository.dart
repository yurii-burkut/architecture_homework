import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import 'package:architecture_sample/network/responses/breed_details_response.dart';
import 'package:architecture_sample/network/responses/breed_images_response.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';

import '../breeds_list/models/breed.dart';

class CatsWikiRepository {
  const CatsWikiRepository({required BreedsApiService breedsApiService})
      : _breedsApiService = breedsApiService;

  final BreedsApiService _breedsApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
  );
  Future<BreedDetails> loadBreedsDetails(breedId) => _breedsApiService.getBreedsDetails(breedId).then(
        (value) => value.entity);

  Future<List<BreedImage>> loadBreedsImage(breedId) => _breedsApiService.getCatsImagesByBreed(breedId).then(
          (value) => value.map((item) => item.entity).toList(),
  );
}
