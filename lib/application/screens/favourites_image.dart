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
  // void initState() {
  //   //super.initState();
  //   sendPostRequest();
  // }
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
  void sendPostRequest() async {
    try {
      Dio dio = Dio()
        ..options.headers['x-api-key'] = 'DEMO-API-KEY'
        ..interceptors.add(LogInterceptor());

      Response response = await  dio.post('https://api.thecatapi.com/v1/favourites',
        data: {'image_id': '${breed.referenceImageId}',
               'sub_id': 'vasiliyRich'},
      );

      print('ВІДПОВІДЬ СЕРВЕРА : ${response.data}');
      return (response.data);
    } catch (error) {
      print('ПОМИЛКА : ${error.toString()}');
    }
  }
}