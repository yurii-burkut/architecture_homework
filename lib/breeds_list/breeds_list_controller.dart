import 'package:architecture_sample/breeds_list/pages/breed_images_page.dart';
import 'package:architecture_sample/breeds_list/pages/favourite_images_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';

enum LoadingStatus { loading, completed, error }

class BreedsListController {
  BreedsListController({required CatsWikiRepository repository})
      : _repository = repository {
    _loadBreeds();
  }

  final CatsWikiRepository _repository;
  List<String> favouriteImages = [];

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

  Future<List<Map<String, String>>> findImages(Breed breed) async{
    final images = await _repository.loadImages(breed.id);
    if (images.isEmpty){
      print('err no image');
    }
    print('res $images');
    return images;

  }

  void openImages(List<Map<String, String>> images, BuildContext context) {
    final controller = context.read<BreedsListController>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BreedImagesPage(
          images: images,
          controller: controller,
        ),
      ),
    );
  }

  Future<void> sendFavouriteImage(String imageId) async {
    await _repository.sendFavourite(imageId);
  }

  Future<List<String>> findFavImages() async{
    favouriteImages = await _repository.loadFavourite();
    if (favouriteImages.isEmpty){
      print('err no image');
    }
    print('res $favouriteImages');
    return favouriteImages;
  }

  void openFavImages(List<String> images, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteImagesPage()));
  }

  /*Future<void> deleteFavouriteImage(int id) async {
    await _repository.deleteFavourite(id);
  }*/
}