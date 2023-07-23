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

  List<int> favoriteIds = [];

  void _updateFavoriteIds(List<String> favoriteImages) {
    // Конвертуємо список зображень улюблених в список favoriteIds,
    // за допомогою методу map() і indexOf()
    favoriteIds = favoriteImages.map((imageUrl) {
      final index = favoriteImages.indexOf(imageUrl);
      if (index != -1) {
        return index;
      } else {
        return -1;
      }
    }).toList();
  }

  // Повертає favoriteId, якщо imageUrl знаходиться у списку улюблених, інакше повертає null
  int? getFavoriteId(String imageUrl) {
    final index = favoriteImagesListenable.value.indexOf(imageUrl);
    if (index != -1) {
      // Зображення знайдено у списку улюблених
      // Повертаємо favoriteId, який відповідає індексу в списку
      return favoriteIds[index];
    } else {
      // Зображення не знайдено у списку улюблених
      return null;
    }
  }

  // Додає favoriteId до списку favoriteIds
  void addFavoriteId(int favoriteId) {
    if (!favoriteIds.contains(favoriteId)) {
      favoriteIds.add(favoriteId);
    }
  }

  // Видаляє favoriteId зі списку favoriteIds
  void removeFavoriteId(int favoriteId) {
    favoriteIds.remove(favoriteId);
  }

  //перевірка чи є в улюблених
  bool isImageFavorite(String imageUrl) {
    return favoriteImagesListenable.value.contains(imageUrl);
  }
}

