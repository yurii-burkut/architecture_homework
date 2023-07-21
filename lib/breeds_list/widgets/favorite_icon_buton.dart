import 'package:architecture_sample/breeds_list/breeds_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key, required this.imageId});
  final String? imageId;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool check;
  @override
  initState() {
    super.initState();
    check = context.read<BreedsListController>().checkOnFavorite(widget.imageId);
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<BreedsListController>().onTap(imageId: widget.imageId, isFavorite: check);
          setState(() {
            check = context.read<BreedsListController>().checkOnFavorite(widget.imageId);
          });
        },
        icon: (check) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border));
  }
}
