import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

import '../../breeds_list/models/image_info.dart';
import '../responses/favourites_response.dart';

class FavouritesApiServis {
  const FavouritesApiServis({required Dio client}) : _client = client;

  final Dio _client;

  Future<void> sendPostRequestOn(imageId) async {
    try {

      Response response = await _client.post(
        '/favourites',
        data: {'image_id': '$imageId',
          'sub_id': 'victoryUser'},
      );

      print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');


    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }
  Future<List<FavouritesImageInfo>?> getImageInfoList() async{
    List<FavouritesImageInfo> imageInfoList = [];
    try {

      final response = await _client.get(
          '/favourites', queryParameters: {
          'sub_id': 'victoryUser',
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

      Response response = await _client.delete(
          '/favourites/$favouriteId'
      );

      print('КАРТИНКУ ВИДАЛЕНО : ${response.data}');
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }

}
