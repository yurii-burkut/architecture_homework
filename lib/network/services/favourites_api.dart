import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

class FavouritesApiServis {
  const FavouritesApiServis({required Dio client}) : _client = client;

  final Dio _client;

  void sendPostRequestOn(imageId) async {
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
      return (response.data);
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }

  // Future<List<PostResponse>?> sendPostRequest(String imageId) async {
  //   try {
  //     Dio dio = Dio();
  //     Response response = await _client.post('https://api.thecatapi.com/v1/favourites',
  //       data: {
  //         'image_id': '$imageId',
  //         'sub_id': 'vasiliyRich'},
  //);
  // Response response = await  dio.post('https://api.thecatapi.com/v1/favourites',
  //   data: {'image_id': '$imageId}',
  //     'sub_id': 'vasiliyRich'},
  // );

  //   print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');
  //   return (response.data);
  // } catch (error) {
  //   print('ПОМИЛКА : ${error.toString()}');
  // }
  //   print(response.data);
  //   return (response.data as Iterable)
  //       .map((element) =>
  //       PostResponse.fromJson(element as Map<String, dynamic>))
  //       .toList();
  // } catch (error) {
  //   print(error.toString());
  // }
  //}

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

  void getFavourites() async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      final response = await dio.get(
          'https://api.thecatapi.com/v1/favourites', queryParameters: {
        'sub_id': 'vasiliyRich',
      });
      print('ВИБРАНІ КАРТИНКИ  : ${response.data}');
      return (response.data);
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }
}
