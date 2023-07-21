import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../breeds_list/models/image_info.dart';
import '../../network/services/favourites_api.dart';

class BreedsFavouritesPage extends StatefulWidget {
  const BreedsFavouritesPage({
    super.key,
    required this.favouritesImages,
  });

  final List<FavouritesImageInfo> favouritesImages;

  @override
  State<BreedsFavouritesPage> createState() => _BreedsFavouritesPageState();
}

class _BreedsFavouritesPageState extends State<BreedsFavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Icon(Icons.star)),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  widget.favouritesImages[index].imageURL.toString(),
                  errorBuilder: (context, o, _) => const Icon(
                    Icons.image_not_supported_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final controller = context.read<FavouritesApiServis>();
                    await controller
                        .sendDeleteRequest(widget.favouritesImages[index].id!);
                        },
                     icon: const Icon(Icons.delete),
                ),
              ],
            );
          },
          separatorBuilder: (context, _) => Container(
            height: 24,
            child: const Center(
              child: Icon(
                Icons.more_horiz,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          itemCount: widget.favouritesImages.length,
        ),
      ),
    );
  }
}
