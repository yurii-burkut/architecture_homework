import 'package:architecture_sample/network/responses/breed_response.dart';
import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';

import '../breeds_list/models/breed.dart';
import '../network/services/favourites_api.dart';

class CatsWikiRepository {
   const CatsWikiRepository({
        required BreedsApiService breedsApiService})
      : _breedsApiService = breedsApiService;

  final BreedsApiService _breedsApiService;
 // final FavouritesApiServis _favouritesApiServis;

  Future<List<Breed>> loadBreeds() => _breedsApiService.getBreeds().then(
        (value) => value.map((item) => item.entity).toList(),
      );
   // Future<List<dynamic>> loadImage() => _favouritesApiServis.sendPostRequest('NZpO4pU56M').then(
   //       (value) => value!.map((item) => item.entity).toList(),
   //);


}
