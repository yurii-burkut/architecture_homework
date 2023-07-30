import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorites_controller.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final String imageUrl;
  final Key? key;

  const FavoriteButton({
    required this.isFavorite,
    required this.onPressed,
    required this.imageUrl,
    this.key,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () async {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        widget.onPressed();

        if (_isFavorite) {
          final favoritesController = context.read<FavoritesController>();
          favoritesController.addToFavorites(widget.imageUrl);
        } else {
          final favoritesController = context.read<FavoritesController>();
          favoritesController.removeFromFavorites(widget.imageUrl);
        }
      },
      iconSize: 36,
    );
  }
}
