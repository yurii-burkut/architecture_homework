import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/breeds_list/models/breed.dart';

import '../breeds_list/models/breed_details.dart';
import '../network/services/breed_details_api_service.dart';
import '../network/services/favorite_image_api_service.dart';

class CatsWikiRepository {
  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final BreedDetailsApiService _breedDetailsApiService;
  final FavoriteImageApiService _favoriteImageApiService;
  final String _subId;

  CatsWikiRepository({
    required BreedsApiService breedsApiService,
    required ImageApiService imageApiService,
    required BreedDetailsApiService breedDetailsApiService,
    required FavoriteImageApiService favoriteImageApiService,
    String subId = 'Tast_yuta_788905',
  })
      : _breedsApiService = breedsApiService,
        _imageApiService = imageApiService,
        _breedDetailsApiService = breedDetailsApiService,
        _favoriteImageApiService = favoriteImageApiService,
        _subId = subId;

  Future<List<Breed>> loadBreeds() async {
    final breedResponses = await _breedsApiService.getBreeds();
    return breedResponses.map((response) => response.entity).toList();
  }

  Future<List<String>> loadImages(String breedId) async {
    final images = await _imageApiService.getImagesByBreed(breedId);
    return images.cast<String>();
  }

  Future<BreedDetails> loadBreedDetails(String breedId) async {
    final breedDetailsResponse = await _breedDetailsApiService.getBreedDetails(breedId);
    final breedDetails = BreedDetails.fromResponse(breedDetailsResponse);
    return breedDetails;
  }

  Future<List<String>> loadFavoriteImages() async {
    return _favoriteImageApiService.getFavoriteImages();
  }

  Future<void> addToFavorites(String imageId, {String? subId}) async {
    final requestBody = {
      'image_id': imageId,
      'sub_id': subId ?? _subId,
    };

    await _favoriteImageApiService.addToFavorites(requestBody);
  }

  Future<void> removeFromFavorites(int favoriteId) async {
    await _favoriteImageApiService.removeFromFavorites(favoriteId);
  }

  CatsWikiRepository copyWithSubId(String? subId) {
    return CatsWikiRepository(
      breedsApiService: _breedsApiService,
      imageApiService: _imageApiService,
      breedDetailsApiService: _breedDetailsApiService,
      favoriteImageApiService: _favoriteImageApiService,
      subId: subId ?? _subId,
    );
  }
}
