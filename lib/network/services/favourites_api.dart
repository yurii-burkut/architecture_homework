import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

import '../../breeds_list/models/image_info.dart';
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
  Future<List<FavouritesImageInfo>?> getImageInfoList() async{
    List<FavouritesImageInfo> imageInfoList = [];
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
          int? id = favouritesResponse.id;
          String? imageURL = favouritesResponse.image?.url;
          if (id != null && imageURL != null) {
            FavouritesImageInfo imageInfo = FavouritesImageInfo(id: id, imageURL: imageURL);
            imageInfoList.add(imageInfo);
          }

        }
      } else {
        print('Error: ${response.statusCode}');
      }
      for (FavouritesImageInfo imageInfo in imageInfoList) {
        print("ID: ${imageInfo.id}");
        print("Image URL: ${imageInfo.imageURL}");
      }

      return imageInfoList;

  }catch (error) {
  print('ПОМИЛКА : ${error.toString()}');
  }
}


  Future <void> sendDeleteRequest(int favouriteId) async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());
      Response response = await dio.delete(
          'https://api.thecatapi.com/v1/favourites/$favouriteId'
      );

      print('КАРТИНКУ ВИДАЛЕНО : ${response.data}');
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

    } catch (error) {
     print('ПОМИЛКА : ${error.toString()}');
    }
  }
}
