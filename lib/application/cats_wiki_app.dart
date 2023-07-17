import 'package:architecture_sample/network/dio_client.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list/pages/breeds_list_page.dart';
import '../network/services/favorites_api_service.dart';
import '../network/services/image_api-service.dart';
import '../repositories/breeds_search_repository.dart';

class CatsWikiApp extends StatelessWidget {
  const CatsWikiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioClient.instance),
        Provider(create: (context) => BreedsApiService(client: context.read())),
        Provider(create: (context) => ImageApiService(client: context.read())),
        Provider(
            create: (context) => FavoritesApiService(client: context.read())),
        Provider(
          create: (context) => CatsWikiRepository(
            breedsApiService: context.read(),
            imageApiService: context.read(),
            favoritesApiService: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const CatsWikiPage(),
      ),
    );
  }
}
