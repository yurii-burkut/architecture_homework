import 'package:architecture_sample/breeds_list/models/breed.dart';
import 'package:flutter/material.dart';

import '../../favorites/widgets/favorite_button.dart';


class BreedCard extends StatefulWidget {
  const BreedCard({
    required this.breed,
    required this.onPressedShare,
    required this.onPressedPhoto,
    required this.onPressedMoreDetails,
    Key? key,
  }) : super(key: key);

  final Breed breed;
  final void Function() onPressedShare;
  final void Function() onPressedPhoto;
  final void Function() onPressedMoreDetails;

  @override
  _BreedCardState createState() => _BreedCardState();
}

class _BreedCardState extends State<BreedCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.breed.imageUrl != null)
              Image.network(
                widget.breed.imageUrl!,
                errorBuilder: (context, o, _) => const Icon(
                  Icons.image_not_supported_outlined,
                ),
              ),
            const SizedBox(height: 8.0),
            Text(
              widget.breed.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    widget.breed.origin,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  IconButton(
                    onPressed: widget.onPressedShare,
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: widget.onPressedPhoto,
                    icon: const Icon(Icons.photo),
                  ),
                  GestureDetector(
                    onTap: widget.onPressedMoreDetails,
                    child: const Text(
                      'More Details',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  FavoriteButton(
                    isFavorite: _isFavorite,
                    onPressed: _toggleFavorite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        // дія додавання улюбленого зображення
      } else {
        // дія видалення улюбленого зображення
      }
    });
  }
}
