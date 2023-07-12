import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breed_details/breed_details_list_page.dart';
import '../breeds_list/breeds_list_page.dart';
import '../network/services/breed_details_api_service.dart';
import '../network/services/breeds_api_service.dart';
import '../network/services/image_api_service.dart';
import '../repositories/breeds_datails_search_repository.dart';
import '../repositories/breeds_search_repository.dart';
import 'package:architecture_sample/network/dio_client.dart';

class CatsWikiApp extends StatelessWidget {
  const CatsWikiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioClient.instance),
        Provider(create: (context) => BreedsApiService(client: context.read())),
        Provider(create: (context) => ImageApiService(client: context.read())),
        Provider(create: (context) => BreedDetailsApiService(client: context.read())),
        Provider(
          create: (context) => CatsWikiRepository(
            breedsApiService: context.read(),
            imageApiService: context.read(),
          ),
        ),
        Provider(
          create: (context) => BreedDetailsSearchRepository(
            breedDetailsApiService: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Cats Wiki'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          body: const CatsWikiPage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
