import 'package:flutter/material.dart';
import '../../application/app_shell.dart';
import '../../favorites/widgets/favorite_button.dart';

class BreedImagePage extends StatelessWidget {
  const BreedImagePage({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      subTitle: ' / Photos',
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image.network(
                images[index],
                errorBuilder: (context, o, _) =>
                const Icon(Icons.image_not_supported),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: FavoriteButton(
                  isFavorite: false,
                  onPressed: () {
                    // Логіка при натисканні на кнопку улюбленого
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, _) => const SizedBox(
          height: 24,
          child: Icon(
            Icons.remove_red_eye,
            size: 24,
          ),
        ),
        itemCount: images.length,
      ),
    );
  }
}
