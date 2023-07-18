import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../breeds_list/widgets/breed_card.dart';
import '../breeds_list/models/breed.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Dio _dio;
  List<Breed> _favoriteBreeds = [];

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _getFavoriteBreeds();
  }

  Future<void> _getFavoriteBreeds() async {
    final apiUrl = 'https://api.thecatapi.com/v1/favourites';
    final apiKey =
        'live_n4d5FPV0uY0Br4loCo13WbraocoWtDv8jm3zlqw4iCvmShOAuxT9NDHeaUwYcEoB';
    final subId =
        'test-user-123'; // Use a test sub_id value for testing purposes

    try {
      final response = await _dio.get(
        apiUrl,
        queryParameters: {'sub_id': subId},
        options: Options(headers: {'x-api-key': apiKey}),
      );

      final favorites = (response.data as List<dynamic>)
          .map((fav) => fav['image'] as Map<String, dynamic>)
          .toList();

      final favoriteBreeds = favorites.map((fav) {
        final breed = Breed(
          id: fav['id'] as String,
          name: fav['name'] as String,
          temperament: fav['temperament'] as String,
          origin: fav['origin'] as String,
          url: fav['url'] as String?,
        );
        return breed;
      }).toList();

      setState(() {
        _favoriteBreeds = favoriteBreeds;
      });
    } catch (error) {
      // Handle the error based on your app's requirements
    }
  }

  Future<void> _addBreedToFavorites(Breed breed) async {
    final apiUrl = 'https://api.thecatapi.com/v1/favourites';
    final apiKey =
        'live_n4d5FPV0uY0Br4loCo13WbraocoWtDv8jm3zlqw4iCvmShOAuxT9NDHeaUwYcEoB';
    final subId =
        'test-user-123'; // Use a test sub_id value for testing purposes

    final rawBody = {
      'image_id': breed.id,
      'sub_id': subId,
    };

    try {
      final response = await _dio.post(
        apiUrl,
        options: Options(headers: {'x-api-key': apiKey}),
        data: rawBody,
      );

      if (response.statusCode == 200) {
        // Breed successfully added to favorites
        // Refresh the favorites list
        _getFavoriteBreeds();
      } else {
        // Handle the error based on your app's requirements
      }
    } catch (error) {
      // Handle the error based on your app's requirements
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: _favoriteBreeds.length,
        itemBuilder: (context, index) {
          final breed = _favoriteBreeds[index];
          return BreedCard(
            breed: breed,
            onPressed: () {
              _addBreedToFavorites(breed);
            },
          );
        },
      ),
    );
  }
}
