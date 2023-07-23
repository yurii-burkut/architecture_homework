import 'package:architecture_sample/network/responses/breed_details_response.dart';
import 'package:architecture_sample/network/responses/breed_images_response.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/responses/favourite_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/breeds_details_api_service.dart';
import 'package:architecture_sample/network/services/breeds_image_api_service.dart';

import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import 'package:architecture_sample/network/services/country_code_api_service.dart';
import 'package:architecture_sample/network/services/favourite_api_sevice.dart';
import '../breeds_list/models/breed.dart';
import '../favourite/models/favourite.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required BreedsDetailsApiService breedsDetailsApiService,
    required BreedsImageApiService breedsImageApiService,
    required FlagApiService flagApiService,
    required FavouriteApiService favouriteApiService,
  })
      : _breedsApiService = breedsApiService,
        _breedsDetailsApiService = breedsDetailsApiService,
        _breedsImageApiService = breedsImageApiService,
        _flagApiService = flagApiService,
        _favouriteApiService = favouriteApiService;

  final BreedsApiService _breedsApiService;
  final BreedsDetailsApiService _breedsDetailsApiService;
  final BreedsImageApiService _breedsImageApiService;
  final FlagApiService _flagApiService;
  final FavouriteApiService _favouriteApiService;

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

  Future<List<Favourite>> loadFavourite() async {
    return await _favouriteApiService.getFavourite().then((value) => value.map((item) => item.entity).toList());
  }

  Future<void> postFavourite(String imageId) async {
    await _favouriteApiService.postFavourite(imageId);
  }

  Future<void> deleteFavourite(int favouriteId) async {
    await _favouriteApiService.deleteFavourite(favouriteId);
  }
}
