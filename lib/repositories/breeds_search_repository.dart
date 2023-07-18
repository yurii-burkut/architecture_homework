import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';

import '../breeds_list/models/breed.dart';
import '../network/services/favorite_image_api_service.dart';
import '../network/services/image_api_service.dart';

class CatsWikiRepository {
  const CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
    required FavoriteImageApiService favoriteImageApiService,
  })  : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService,
        _favoriteImageApiService = favoriteImageApiService;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final FavoriteImageApiService _favoriteImageApiService;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
  );

  Future<List<String>> loadImages(String breedId) =>
      _imageApiService.getImagesByBreed(breedId);


}
