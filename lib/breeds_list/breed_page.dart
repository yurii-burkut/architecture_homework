import 'package:flutter/material.dart';
import 'models/breed.dart';
import 'package:dio/dio.dart';

class BreedPage extends StatefulWidget {
  const BreedPage({required this.breed, Key? key}) : super(key: key);

  final Breed breed;

  @override
  _BreedPageState createState() => _BreedPageState();
}

class _BreedPageState extends State<BreedPage> {
  late Dio _dio;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final apiUrl = 'https://api.thecatapi.com/v1/favourites';
    final apiKey = 'YOUR_API_KEY';

    try {
      final response = await _dio.get(
        apiUrl,
        queryParameters: {'sub_id': 'your-unique-sub-id'},
        options: Options(headers: {'x-api-key': apiKey}),
      );

      final favorites = (response.data as List<dynamic>)
          .map((fav) => fav['image_id'] as String)
          .toList();

      setState(() {
        _isFavorite = favorites.contains(widget.breed.id);
      });
    } catch (error) {
      // Handle the error based on your app's requirements
    }
  }

  Future<void> _toggleFavoriteStatus() async {
    final apiUrl = 'https://api.thecatapi.com/v1/favourites';
    final apiKey = 'YOUR_API_KEY';

    final favoriteData = {
      'image_id': widget.breed.id,
      'sub_id': 'your-unique-sub-id',
    };

    try {
      if (_isFavorite) {
        // Delete favorite
        final response = await _dio.delete(
          '$apiUrl/${widget.breed.id}',
          options: Options(headers: {'x-api-key': apiKey}),
        );

        if (response.statusCode == 200) {
          setState(() {
            _isFavorite = false;
          });
        } else {
          // Error deleting favorite
          // Handle the error based on your app's requirements
        }
      } else {
        // Add favorite
        final response = await _dio.post(
          apiUrl,
          options: Options(headers: {'x-api-key': apiKey}),
          data: favoriteData,
        );

        if (response.statusCode == 200) {
          setState(() {
            _isFavorite = true;
          });
        } else {
          // Error adding favorite
          // Handle the error based on your app's requirements
        }
      }
    } catch (error) {
      // Handle the error based on your app's requirements
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.breed.imageUrl ?? ''),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temperament:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.breed.temperament,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Origin:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.breed.origin,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Wikipedia:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.breed.url ?? 'N/A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _toggleFavoriteStatus,
                  child: Text(_isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}