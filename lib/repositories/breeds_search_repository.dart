import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';

import '../breeds_list/models/breed.dart';
import '../network/services/favourites_api_service.dart';

class CatsWikiRepository {
  const CatsWikiRepository(
      {required BreedsApiService breedsApiService,
      required ImageApiService imageApiService,
      required FavouritesApiService favouritesApiService})
      : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService,
        _favouritesApiService = favouritesApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final FavouritesApiService _favouritesApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );
  Future<List<Map<String, String>>> loadImages(String breedId) =>
      _imageApiService.getImagesByBreed(breedId);

  Future<List<Map<String, String>>> loadFavouritesImages() =>
      _favouritesApiService.getFavourite();

  Future<void> sendFavouritesImages(String imageId) async =>
      await _favouritesApiService.postFavourite(imageId);

  Future<void> deleteFavouritesImages(int id) async =>
      await _favouritesApiService.deleteFavourite(id);
}
