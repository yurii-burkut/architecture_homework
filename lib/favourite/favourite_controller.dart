
import 'package:architecture_sample/favourite/models/favourite.dart';
import 'package:flutter/foundation.dart';

import '../repositories/breeds_search_repository.dart';

enum LoadingStatus { loading, completed, error }

class FavouriteController {
  FavouriteController({required CatsWikiRepository repository})
      : _repository = repository{
    _loadFavouriteDetail();
  }

  final CatsWikiRepository _repository;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);

  final ValueNotifier<List<Favourite>> favouriteListenable = ValueNotifier([]);


  void _loadFavouriteDetail() async {
    await  _repository.loadFavourite().then((value) {
      favouriteListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
    loadingStatus.value = LoadingStatus.error;
    });
  }

  void postFavourite(String imageId) async {
    await _repository.postFavourite(imageId);
  }

  void deleteFavourite(Favourite favourite) async {
    await _repository.deleteFavourite(favourite.id);
    favouriteListenable.value.remove(favourite);
    favouriteListenable.notifyListeners();
  }

  void onRetryClicked() {
    _loadFavouriteDetail();
  }


}