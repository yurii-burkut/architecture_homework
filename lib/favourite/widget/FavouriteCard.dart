
import 'package:architecture_sample/favourite/models/favourite.dart';
import 'package:flutter/material.dart';


class FavouriteCard extends StatelessWidget {
  const FavouriteCard({required this.favourite, Key? key, this.onPressed})
      : super(key: key);

  final Favourite favourite;
  final VoidCallback? onPressed;

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
            Image.network(
                  favourite.image.url,
                  errorBuilder: (context, o, _) => const Icon(
                    Icons.image_not_supported_outlined,
                  ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.delete),
                      color: Colors.redAccent,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}