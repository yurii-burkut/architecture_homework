import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repositories/breeds_search_repository.dart';
import 'models/breed.dart';
import 'pages/breed_details_list_page.dart';
import 'pages/breed_images_page.dart';
import 'models/breed_details.dart';

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

  Future<void> loadBreedDetailsAndOpenPage(Breed breed, BuildContext context) async {
    loadingStatus.value = LoadingStatus.loading;

    try {
      final breedDetails = await _repository.loadBreedDetails(breed.id);

      loadingStatus.value = LoadingStatus.completed;

      openBreedDetailsPage(breedDetails, context);
    } catch (error) {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void openBreedDetailsPage(BreedDetails breedDetails, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BreedDetailsListPage(breedDetails: breedDetails),
      ),
    );
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

  void openImagesAndBreedDetails(Breed breed, BuildContext context) async {
    final images = await findImages(breed);
    final breedDetails = await _repository.loadBreedDetails(breed.id);

    openImages(images, context);
    openBreedDetailsPage(breedDetails, context);
  }

  Future<void> launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      print('Could not launch $uri');
    }
  }
}
