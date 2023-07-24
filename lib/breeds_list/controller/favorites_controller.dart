import 'package:flutter/foundation.dart';

class FavoritesController extends ChangeNotifier {
  List<String> _favoriteImages = [];

  List<String> get favoriteImages => _favoriteImages;

  bool isFavorite(String imageUrl) {
    return _favoriteImages.contains(imageUrl);
  }

  void toggleFavorite(String imageUrl) {
    if (_favoriteImages.contains(imageUrl)) {
      _favoriteImages.remove(imageUrl);
    } else {
      _favoriteImages.add(imageUrl);
    }
    notifyListeners();
  }
  void removeFavoriteImage(String imageUrl) {
    favoriteImages.remove(imageUrl);
    notifyListeners();
  }
}
