
import 'package:architecture_sample/breeds_list/widgets/breed_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';

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

  Future<List<String>> findImages(Breed breed) async {
    final images = await _repository.loadImages(breed.id);
    if (images.isEmpty) {
      print('error no image');
    }else {
      print('Images: $images');
    }

    return images;
  }
  void openImages(List<String> images, Breed breed, BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BreedDetail(images: images, breed: breed,) )
    );

  }
}

enum LoadingStatus { loading, completed, error }
