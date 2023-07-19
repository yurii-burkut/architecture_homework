import 'package:architecture_sample/breeds_list/pages/breed_images_page.dart';
import 'package:flutter/material.dart';
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

  Future<void> openUri(Breed breed, BuildContext context) async {
    if (breed.url != null) {
      final uri = Uri.parse(breed.url!);
      await launchUrl(uri);
    }
  }

  Future<List<String>> findImages(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    return images;
  }

  openImages({required List<String> images, required Breed breed, required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BreedImagesPage(
          images: images,
          breed: breed,
        ),
      ),
    );
  }
}
