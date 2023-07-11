import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import '../breeds_list/models/breed.dart';
import 'breed_details_page.dart';

enum LoadingStatus { loading, completed, error }

class BreedsListController {
  BreedsListController({required this.repository}) {
    _loadBreeds();
  }

  final CatsWikiRepository repository;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<List<Breed>> breedsListenable = ValueNotifier([]);

  void _loadBreeds() {
    repository.loadBreeds().then((value) {
      breedsListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
      loadingStatus.value = LoadingStatus.error;
    });
  }

  void onRetryClicked() {
    _loadBreeds();
  }

  Future<void> openBreedDetailsPage(BuildContext context, Breed breed) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BreedDetailsPage(breed: breed),
      ),
    );
  }
}
