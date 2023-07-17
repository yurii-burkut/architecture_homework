import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FavouritesImagesPage extends StatelessWidget {
  const FavouritesImagesPage({Key? key}) : super(key: key);

  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final subId = uuid.v4();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites Images'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text('Favourites Images'),
      ),
    );
  }
}
