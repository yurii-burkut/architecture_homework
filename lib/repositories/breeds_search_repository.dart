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
  })  : _breedsApiService = breedsApiService,
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

  Future<List<Map<String, dynamic>>> loadFavoriteImages() async {
    final favoriteImages = await _favoriteImageApiService.getFavoriteImages();
    final List<Map<String, dynamic>> favoritesData = [];

    for (final imageMap in favoriteImages) {
      if (imageMap['image'] != null && imageMap['image']['url'] != null) {
        final imageUrl = imageMap['image']['url'] as String;
        final imageId = imageMap['image']['id'] as String;

        favoritesData.add({
          'id': imageMap['id'], // ID фавор
          'imageId': imageId,   // ID картинки
          'imageUrl': imageUrl, // URL картинки
        });
      }
    }

    return favoritesData;
  }



  Future<void> addToFavorites(String imageId) async {
    await _favoriteImageApiService.addToFavorites(imageId, subId: _subId);

  }

  Future<void> removeFromFavorites(String imageId) async {
    final favoriteImagesData = await loadFavoriteImages();
    final int? favoriteID = getFavoriteIdByImageId(favoriteImagesData, imageId);
    await _favoriteImageApiService.removeFromFavorites(favoriteID!);
  }


  int? getFavoriteIdByImageId(List<Map<String, dynamic>> favoritesData, String imageId) {
    for (final favorite in favoritesData) {
      final String? imageIdInData = favorite['imageId'];
      if (imageIdInData != null && imageIdInData == imageId) {
        return favorite['id'];
      }
    }
    return null;
  }

}