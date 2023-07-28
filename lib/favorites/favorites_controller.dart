
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


  void _loadFavoriteImages() {
    loadingStatus.value = true;

    _repository.loadFavoriteImages().then((value) {
      favoriteImagesListenable.value = value.map((item) => item['imageUrl'] as String).toList();
      loadingStatus.value = false;
    }).catchError((error) {
      loadingStatus.value = false;
      print('load Error loading favorite images: $error');
    });
  }



  Future<void> addToFavorites(String imageUrl) async {
    try {
      final imageId = await _getImageIdByUrl(imageUrl);
      final requestBody = {
        'image_id': imageId,
      };

      await _repository.addToFavorites(imageId);
      _loadFavoriteImages();
    } catch (error) {
      print('Error adding to favorites: $error');
    }
  }



  Future<void> removeFromFavorites(String imageUrl) async {
    try {
      final imageId = await _getImageIdByUrl(imageUrl);
      final requestBody = {
        'image_id': imageId,
      };
      await _repository.removeFromFavorites(imageId);
      _loadFavoriteImages();
    } catch (error) {
      print('Error removing from favorites: $error');
    }
  }



  bool isImageFavorite(String imageUrl) {
    return favoriteImagesListenable.value.contains(imageUrl);
  }

  Future<String> _getImageIdByUrl(String imageUrl) async {
    final parts = imageUrl.split('/');
    final imageIdWithExtension = parts.last;
    final imageIdParts = imageIdWithExtension.split('.');
    final imageId = imageIdParts.first;
    return imageId;
  }


}