import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteButton({required this.isFavorite, required this.onPressed, Key? key}) : super(key: key);

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
        color: _isFavorite ? Colors.red : Colors.grey, // Змінила колір для неактивного стану
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite; // Оновити стан сердечка при натисканні
        });
        widget.onPressed(); // Викликати колбек при натисканні
      },
      iconSize: 36,
    );
  }
}
