import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';
import 'models/breed_details.dart';
import '../breeds_list/pages/breed_images_page.dart';
import '../breeds_list/pages/breed_details_list_page.dart'; // Замінено імпорт на BreedDetailsListWidget

enum LoadingStatus { loading, completed, error }

class BreedsListController {
  BreedsListController({required CatsWikiRepository repository})
      : _repository = repository {
    _loadBreeds();
  }

  final CatsWikiRepository _repository;
  late BuildContext _context;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<List<Breed>> breedsListenable = ValueNotifier([]);
  final ValueNotifier<List<BreedDetails>> breedDetailsListenable =
  ValueNotifier([]);

  void _loadBreeds() {
    _repository.loadBreeds().then((value) {
      breedsListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    }).catchError((error) {
      loadingStatus.value = LoadingStatus.error;
    });
  }

  void onRetryClicked() {
    _loadBreeds();
  }

  Future<void> onPressedMoreDetails(Breed breed, BuildContext context) async {
    _context = context;
    loadingStatus.value = LoadingStatus.loading;

    try {
      final breedDetails = await _repository.loadBreedDetails(breed.id);

      breedDetailsListenable.value = [breedDetails];
      loadingStatus.value = LoadingStatus.completed;

      openBreedDetailsListPage(); // Викликайте метод openBreedDetailsListPage
    } catch (error) {
      breedDetailsListenable.value = [];
      loadingStatus.value = LoadingStatus.error;
    }
  }

  Future<void> openUri(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    if (images.isEmpty) {
      final uri = Uri.parse(breed.url!);
      await launchUrl(uri);
    }
  }

  Future<List<String>> findImages(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    if (images.isEmpty) {
      print('error no images');
    }
    return images;
  }

  void openImages(List<String> images, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BreedImagePage(images: images),
      ),
    );
  }

  void openBreedDetailsListPage() { // Доданий метод openBreedDetailsListPage
    Navigator.of(_context).push(
      MaterialPageRoute(
        builder: (context) => BreedDetailsListWidget(),
      ),
    );
  }
}
