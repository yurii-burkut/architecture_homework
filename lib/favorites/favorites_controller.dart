import 'package:flutter/material.dart';
import '../repositories/breeds_search_repository.dart';

class FavoritesController {
  FavoritesController({
    required CatsWikiRepository repository,
    String? subId,
  }) : _repository = repository {
    _loadFavoriteImages();
  }

  final CatsWikiRepository _repository;
  late BuildContext _context;

  final ValueNotifier<List<String>> favoriteImagesListenable = ValueNotifier([]);
  final ValueNotifier<bool> loadingStatus = ValueNotifier(false);
  final List<int> favoriteIds = [];

  void _loadFavoriteImages() {
    loadingStatus.value = true;

    _repository.loadFavoriteImages().then((value) {
      favoriteImagesListenable.value = value;
      _updateFavoriteIds(value);
      loadingStatus.value = false;
    }).catchError((error) {
      loadingStatus.value = false;
      print('load Error loading favorite images: $error');
    });
  }

  Future<void> addToFavorites(String imageUrl) async {
    print('Image URL before addToFavorites: $imageUrl'); // Перевірка чи передано URL
    try {
      final imageId = await _getImageIdByUrl(imageUrl); // Отримати ідентифікатор зображення з URL
      await _repository.addToFavorites(imageId); // Додати зображення до улюблених
    } catch (error) {
      print('Error adding to favorites: $error');
    }
  }


  Future<void> removeFromFavorites(int favoriteId) async {
    try {
      await _repository.removeFromFavorites(favoriteId); // Видалити зображення з улюблених
    } catch (error) {
      print('Error removing from favorites: $error');
    }
  }

  void _updateFavoriteIds(List<String> favoriteImages) {
    favoriteIds.clear();
    for (int i = 0; i < favoriteImages.length; i++) {
      favoriteIds.add(i);
    }
  }

  bool isImageFavorite(String imageUrl) {
    return favoriteImagesListenable.value.contains(imageUrl);
  }

  int? getFavoriteId(String imageUrl) {
    final index = favoriteImagesListenable.value.indexOf(imageUrl);
    if (index != -1) {
      return favoriteIds[index];
    } else {
      return null;
    }
  }

  void addFavoriteId(int favoriteId) {
    if (!favoriteIds.contains(favoriteId)) {
      favoriteIds.add(favoriteId);
    }
  }

  void removeFavoriteId(int favoriteId) {
    favoriteIds.remove(favoriteId);
  }

  Future<String> _getImageIdByUrl(String imageUrl) async {
    // Розділ URL за допомогою слешів
    final parts = imageUrl.split('/');

    // останній елемент
    final imageIdWithExtension = parts.last;

    // Розділ за допомогою крапки
    final imageIdParts = imageIdWithExtension.split('.');

    //  без розширення
    final imageId = imageIdParts.first;

    // Поверніть ідентифікатор
    return imageId;
  }

}
