import 'package:architecture_sample/application/screens/breed_images_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../application/screens/favourites_image.dart';
import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';

enum LoadingStatus { loading, completed, error }

class BreedsListController {
  BreedsListController({required CatsWikiRepository repository})
      : _repository = repository {
    _loadBreeds();
  }

  final CatsWikiRepository _repository;

  final ValueNotifier<LoadingStatus> loadingStatus =
      ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<List<Breed>> breedsListenable = ValueNotifier([]);

  void _loadBreeds() {
    _repository.loadBreeds().then((value) {
      breedsListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
      loadingStatus.value = LoadingStatus.error;
    });
  }

  void onRetryClicked() {
    _loadBreeds();
  }

  Future<void> openUri(Breed breed) async {
    if (breed.url != null) {
      final uri = Uri.parse(breed.url!);
      await launchUrl(uri);
    }
  }
  Future<List> findImages(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    if(images.isEmpty) {
      print('err no images');
    }
    print('res: $images');
    return images;
  }

  void openImages(List<String> images, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BreedsImagesPage(images: images)
        )
    );
  }
  Future<List<String>?> findFavouritesImages() async {
    final favouritesImages = await _repository.loadFavouritesImages();
    if(favouritesImages!.isEmpty) {
      print('err no favourites images');
    }
    print('FAVOURITES RES: $favouritesImages');
    return favouritesImages;
  }
  void openFavouritesImages(List<String> favouritesImages, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            BreedsFavouritesPage(favouritesImages: favouritesImages,)
        )
    );
  }

}
