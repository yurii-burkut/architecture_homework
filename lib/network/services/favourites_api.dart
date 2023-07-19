import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

import '../responses/favourites_response.dart';

class FavouritesApiServis {
  const FavouritesApiServis({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<String>?> sendPostRequestOn(imageId) async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      Response response = await dio.post(
        'https://api.thecatapi.com/v1/favourites',
        data: {'image_id': '$imageId}',
          'sub_id': 'vasiliyRich'},
      );

      print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');

      final rawIterable = (response.data as List<dynamic>).cast<Map<String, dynamic>>();
      return rawIterable.map((e) => e['url'] as String).toList();


    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }


  void sendDeleteRequest(int favouriteId) async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());
      Response response = await dio.delete(
          'https://api.thecatapi.com/v1/favourites/$favouriteId'
      );

      print('КАРТИНКУ ВИДАЛЕНО : ${response.data}');
      return (response.data);
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }

  Future<List<String>?>getFavourites() async {
    List<String> imageUrls = [];
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      final response = await dio.get(
          'https://api.thecatapi.com/v1/favourites', queryParameters: {
        'sub_id': 'vasiliyRich',
      });
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<FavouritesResponse> favouritesResponses = jsonData
            .map((json) => FavouritesResponse.fromJson(json))
            .toList();
        for (var favouritesResponse in favouritesResponses) {
          String? imageUrl = favouritesResponse.image?.url;
          if (imageUrl != null) {
            imageUrls.add(imageUrl);
          }
        }
      } else {
        print('Error: ${response.statusCode}');
      }
      return imageUrls;


      // if (response.statusCode == 200) {
      //   print('ВИБРАНІ КАРТИНКИ  : ${response.data}');
      //   Map<String, dynamic> jsonData = response.data;
      //   FavouritesResponse favouritesResponse = FavouritesResponse.fromJson(jsonData);
      //
      //   String? imageId = favouritesResponse.image?.id;
      //   String? imageUrl = favouritesResponse.image?.url;
      //
      //   print("Image ID: $imageId");
      //   print("Image URL: $imageUrl");
      //   return favouritesResponse.image?.url;
      // } else {
      //   print("Error: ${response.statusCode}");
      // }
    //}
    //   return (response.data as Iterable)
    //       .map((element) =>
    //       FavouritesResponse.fromJson(element as Map<String, dynamic>))
    //       .toList();

      // final rawIterableFawor = response.data.cast<Map<String, dynamic>>();
      // String? imageId = rawIterableFawor.image?.id;
      // String? imageUrl = rawIterableFawor.image?.url;
      // return rawIterableFawor.map((e) => e['image_id'] as String).toList();
    } catch (error) {
     print('ПОМИЛКА : ${error.toString()}');
    }
  }
}
