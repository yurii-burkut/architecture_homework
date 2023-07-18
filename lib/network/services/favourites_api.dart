import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

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
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      final response = await dio.get(
          'https://api.thecatapi.com/v1/favourites', queryParameters: {
        'sub_id': 'vasiliyRich',
      });
      print('ВИБРАНІ КАРТИНКИ  : ${response.data}');
      final rawIterable = (response.data as List<dynamic>).cast<Map<String, dynamic>>();
      return rawIterable.map((e) => e['url'] as String).toList();
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }
}
