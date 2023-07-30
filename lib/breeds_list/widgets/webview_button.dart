import 'package:flutter/material.dart';
import 'package:architecture_sample/breeds_list/widgets/webview_screen.dart';
import '../models/breed.dart';

class WebViewButton extends StatelessWidget {
  final Breed breed;

  const WebViewButton({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (breed.wikipedia_url == null) {
      return Container();
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              initialUrl: breed.wikipedia_url!,
            ),
          ),
        );
      },
      child: const Text(
        'WIKIPEDIA',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}
