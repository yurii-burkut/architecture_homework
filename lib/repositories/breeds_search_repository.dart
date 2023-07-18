import 'package:architecture_sample/breeds_list/models/favorites.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api-service.dart';

import '../breeds_list/models/breed.dart';
import '../network/responses/breed_favorites_response.dart';
import '../network/services/favorites_api_service.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
    required FavoritesApiService favoritesApiService,
  })  : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService,
        _favoritesApiService = favoritesApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final FavoritesApiService _favoritesApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );

  Future<List<String>> loadImages(String breedId) =>
      _imageApiService.getImagesByBreed(breedId);

  Future<List<Favorites>> loadFavorites() =>
      _favoritesApiService.getFavoriteBreeds().then(
              (value) => value.map((item) => item.entity).toList(),
      );

  Future<BreedFavoritesPostResponse> postFavorites(String image_id) =>
      _favoritesApiService.postFavoriteBreedById(image_id);
//TODO get favorite_id
  Future<String> deleteFavorite(String favorite_id) =>
      _favoritesApiService.deleteFavoriteBreed(favorite_id);
}
