import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';

import '../breeds_list/models/breed.dart';
import '../network/services/favourite_api_service.dart';
import '../network/services/image_api_service.dart';

class CatsWikiRepository {
  const CatsWikiRepository({required BreedsApiService breedsApiService,
                            required ImageApiService imageApiService,
                            required FavouriteApiService favouriteApiService})
      : _breedsApiService = breedsApiService, _imageApiService = imageApiService,
        _favouriteApiService = favouriteApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final FavouriteApiService _favouriteApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );

  Future<List<Map<String, String>>> loadImages(String breedId) => _imageApiService.getImagesByBreed(breedId);

  Future<List<String>> loadFavourite() => _favouriteApiService.getFavourite();

  Future<void> sendFavourite(String imageId) async => await _favouriteApiService.postFavourite(imageId);

  //Future<void> deleteFavourite(int id) async => await _favouriteApiService.deleteFavourite(id);

}
