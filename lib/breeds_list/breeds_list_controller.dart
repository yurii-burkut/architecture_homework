import 'package:architecture_sample/breeds_list/pages/breed_images_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';
import 'models/favorites.dart';

enum LoadingStatus { loading, completed, error }

class BreedsListController {
  BreedsListController({required CatsWikiRepository repository})
      : _repository = repository {
    _loadBreeds();
    loadFavoriteImagesUrls();
  }

  final CatsWikiRepository _repository;
  final ValueNotifier<List<Favorites>> favoritesImages = ValueNotifier([]);
  final ValueNotifier<List<Breed>> breedsListenable = ValueNotifier([]);
  final ValueNotifier<LoadingStatus> loadingStatusFavorites =
  ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<LoadingStatus> loadingStatusBreeds =
      ValueNotifier(LoadingStatus.loading);


  void _loadBreeds() {
    _repository.loadBreeds().then((value) {
      breedsListenable.value = value;
      loadingStatusBreeds.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
      loadingStatusBreeds.value = LoadingStatus.error;
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
  Future<List<String>> findImages(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    return images;

  }
  void openImages(List<String> images, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BreedImagesPage(images: images)));
  }

  void loadFavoriteImagesUrls() async {
    _repository.loadFavorites().then((value) {
      favoritesImages.value = value;
      loadingStatusFavorites.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
      loadingStatusFavorites.value = LoadingStatus.error;
    });

  }
  void deleteFavorite(int favoriteId) {
    //TODO get SUCCESS
  }


  void onTap({required String? imageId, required bool isFavorite}) {
    late final int favoriteId;
    if(isFavorite) {
      for(final elem in favoritesImages.value){
        if(elem.imageId == imageId) favoriteId = elem.id;
      }
      _repository.deleteFavorite(favoriteId);
    } else if(imageId != null) {
      _repository.postFavorites(imageId);
    }

  }
  bool checkOnFavorite(String? imageId) {
    bool check = false;
    if(imageId != null && favoritesImages.value.isNotEmpty) {
      for(final elem in favoritesImages.value){
        if(elem.imageId == imageId) check = true;
      }
    }
    return check;
  }

}
//contains
