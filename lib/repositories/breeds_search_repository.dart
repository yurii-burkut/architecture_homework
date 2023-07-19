import 'dart:ui';

import 'package:architecture_sample/breeds_list/models/image_info.dart';
import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/responses/favourites_response.dart';
import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';

import '../breeds_list/breeds_list_controller.dart';
import '../breeds_list/models/breed.dart';
import '../network/services/favourites_api.dart';
import '../network/services/image_api_servise.dart';

class CatsWikiRepository {
   const CatsWikiRepository({
        required BreedsApiService breedsApiService,
        required ImageApiService imageApiService,
        required FavouritesApiServis favouritesApiServis
   })
      :  _breedsApiService = breedsApiService,
         _imageApiService = imageApiService,
         _favouritesApiServis = favouritesApiServis;

  final BreedsApiService _breedsApiService;
  final ImageApiService _imageApiService;
  final FavouritesApiServis _favouritesApiServis;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );

   Future<List<dynamic>> loadImages(String breedId) =>
       _imageApiService.getImageByBreed(breedId);

   // Future<List<String>?> loadFavouritesImages() =>
   //     _favouritesApiServis.getFavourites();

   Future<List<FavouritesImageInfo>?> loadFavouritesImages() =>
       _favouritesApiServis.getImageInfoList();

   Future<void> deleteFavouritesImages(favouriteId) =>
       _favouritesApiServis.sendDeleteRequest(favouriteId);
}
