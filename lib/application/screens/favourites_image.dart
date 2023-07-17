import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../breeds_list/models/breed.dart';

class FavouritesImagesCats extends StatelessWidget{

  final Breed breed;


  const FavouritesImagesCats({
    super.key,
    required this.breed});




  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: const Text('Улюблені фото')
        ),
        body: DecoratedBox(
        decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
      children:
      [
        Image.network(
          breed.imageUrl!,
          errorBuilder: (context, o, _) => const Icon(
            Icons.image_not_supported_outlined,
          ),
        ),
      ],
      ),
      ),
      );
  }
  // void sendPostRequestOn(imageId) async {
  //   try {
  //     Dio dio = Dio()
  //       ..options.headers['x-api-key'] = 'DEMO-API-KEY'
  //       ..interceptors.add(LogInterceptor());
  //
  //     Response response = await  dio.post('https://api.thecatapi.com/v1/favourites',
  //       data: {'image_id': '$imageId}',
  //              'sub_id': 'vasiliyRich'},
  //     );
  //
  //     print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');
  //     return (response.data);
  //   } catch (error) {
  //     print('ПОМИЛКА : ${error.toString()}');
  //   }
  // }
  // void sendDeleteRequest(int favouriteId) async {
  //   try {
  //     Dio dio = Dio()
  //       ..options.headers['x-api-key'] = 'DEMO-API-KEY'
  //       ..interceptors.add(LogInterceptor());
  //     Response response = await  dio.delete('https://api.thecatapi.com/v1/favourites/$favouriteId'
  //     );
  //
  //     print('КАРТИНКУ ВИДАЛЕНО : ${response.data}');
  //     return (response.data);
  //   } catch (error) {
  //     print('ПОМИЛКА : ${error.toString()}');
  //   }
  // }

  // void getFavourrites() async {
  //   try {
  //     Dio dio = Dio()
  //       ..options.headers['x-api-key'] = 'DEMO-API-KEY'
  //       ..interceptors.add(LogInterceptor());
  //
  //   final response = await dio.get('https://api.thecatapi.com/v1/favourites', queryParameters: {
  //     'sub_id': 'vasiliyRich',
  //   });
  //     print('ВИБРАНІ КАРТИНКИ  : ${response.data}');
  //     return (response.data);
  //   } catch (error) {
  //     print('ПОМИЛКА : ${error.toString()}');
  //   }
  // }
}