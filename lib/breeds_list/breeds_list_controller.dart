import 'package:architecture_sample/application/screens/breed_images_page.dart';
import 'package:architecture_sample/breeds_list/models/image_info.dart';
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
  Future<List<FavouritesImageInfo>> findFavouritesImages() async {
    final favouritesImages = await _repository.loadFavouritesImages();
    if(favouritesImages!.isEmpty) {
      print('err no favourites images');
    }
    for (var imageInfo in favouritesImages) {
      print("ID ФАВ: ${imageInfo.id}");
      print("Image URL ФАВ : ${imageInfo.imageURL}");
    }
    return favouritesImages;
  }
  void openFavouritesImages(List<FavouritesImageInfo> favouritesImages, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            BreedsFavouritesPage(favouritesImages: favouritesImages,)
        )
    );
  }
  Future<void> minusFavouritesImages(favouriteId) async {
    final myDeleteImages = _repository.deleteFavouritesImages(favouriteId);

    print('КАРТИНКУ З ID $favouriteId ВИДАЛЕНО');
  }

  Future<void> addFavouritesImages(imageId) async {
    final addFavouritesImages = _repository.loadFavourites(imageId);

    print('КАРТИНКУ З ID $imageId ДОДАНО ДО ВИБРАНИХ');
  }

}
