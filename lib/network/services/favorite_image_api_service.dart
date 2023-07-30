import 'package:dio/dio.dart';

import '../responses/image_response.dart';

class FavoriteImageApiService {
  FavoriteImageApiService({required Dio client}) : _client = client;

  final Dio _client;

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'x-api-key':
        'live_n4d5FPV0uY0Br4loCo13WbraocoWtDv8jm3zlqw4iCvmShOAuxT9NDHeaUwYcEoB',
  };

  Future<void> addFavoriteImage(String imageUrl, String subId) async {
    try {
      final Uri uri = Uri.parse(imageUrl);
      final String imageId = uri.pathSegments.last.split('.').first;

      const url = '/favourites';
      const String subId = "RusPal_123";

      final body = {
        'image_id': imageId,
        'sub_id': subId,
      };

      final response = await _client.post(url,
          data: body, options: Options(headers: _headers));

      if (response.statusCode == 200) {
        print(await response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<List<MyImage>> getFavoriteImages(String subId) async {
    try {
      const url = '/favourites';

      final params = {
        'sub_id': subId,
      };

      final response = await _client.get(url,
          options: Options(headers: _headers), queryParameters: params);

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final List<MyImage> images = [];
        for (final item in data) {
          final id = item['id'] as int?;
          final image = item['image'] as Map<String, dynamic>?;
          final url = image?['url'] as String?;
          if (id != null && url != null) {
            final myImage = MyImage(id: id, image: MyImageModel(url: url));
            images.add(myImage);
          }
        }
        return images;
      } else {
        print(response.statusMessage);
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<void> deleteFavoriteImage(int id) async {
    try {
      final url = '/favourites/$id';

      final response =
          await _client.delete(url, options: Options(headers: _headers));

      if (response.statusCode == 200) {
        print('Favorite image deleted successfully');
      } else {
        print(response.statusMessage);
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
