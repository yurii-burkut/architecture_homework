import 'package:architecture_sample/application/screens/breed_images_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  // Future<List<String>> addFavouriteImages(Breed breed) async {
  //   final images = await _repository.addImages(breed.id);
  //   if(images!.isEmpty) {
  //     print('err no images');
  //   }
  //   print('res: $images');
  //   return images;
  // }

}
