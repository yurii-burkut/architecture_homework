import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';

enum LoadingStatus { loading, completed, error }

class BreedController {
  BreedController({required CatsWikiRepository repository, required String id})
      : _repository = repository {
    _loadBreedById(id);
  }

  final CatsWikiRepository _repository;

  final ValueNotifier<LoadingStatus> loadingStatus =
      ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<Breed> breedsListenable = ValueNotifier<Breed>(Breed(
    id: '',
    name: '',
    temperament: '',
    origin: '',
    url: '',
  ));

  void _loadBreedById(String id) {
    _repository.loadBreedById(id).then((value) {
      breedsListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    }).catchError((error) {
      loadingStatus.value = LoadingStatus.error;
    });
  }

  void onRetryClicked(String id) {
    _loadBreedById(id);
  }

  Future<void> openUri(Breed breed) async {
    if (breed.url != null) {
      final uri = Uri.parse(breed.url!);
      await launchUrl(uri);
    }
  }
}
