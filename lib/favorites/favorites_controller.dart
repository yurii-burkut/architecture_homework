import 'package:flutter/material.dart';
import '../repositories/breeds_search_repository.dart';

class FavoritesController {
  FavoritesController({
    required CatsWikiRepository repository,
    String? subId,
  }) : _repository = repository.copyWithSubId(subId) {
    _loadFavoriteImages();
  }

  final CatsWikiRepository _repository;
  late BuildContext _context;

  final ValueNotifier<List<String>> favoriteImagesListenable = ValueNotifier([]);
  final ValueNotifier<bool> loadingStatus = ValueNotifier(false);

  void _loadFavoriteImages() {
    loadingStatus.value = true;

    _repository.loadFavoriteImages().then((value) {
      favoriteImagesListenable.value = value;
      loadingStatus.value = false;
    }).catchError((error) {
      loadingStatus.value = false;
      print('Error loading favorite images: $error');
    });
  }

  Future<void> addToFavorites(String imageUrl) async {
    try {
      await _repository.addToFavorites(imageUrl);
      _loadFavoriteImages();
    } catch (error) {
      print('Error adding to favorites: $error');
    }
  }

  Future<void> removeFromFavorites(int favoriteId) async {
    try {
      await _repository.removeFromFavorites(favoriteId);
      _loadFavoriteImages();
    } catch (error) {
      print('Error removing from favorites: $error');
    }
  }
}
