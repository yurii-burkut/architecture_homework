import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breed_details/breed_details_list_page.dart';
import '../breeds_list/breeds_list_page.dart';
import '../network/services/breed_details_api_service.dart';
import '../network/services/breeds_api_service.dart';
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
        Provider(create: (context) => BreedDetailsApiService(client: context.read())),
        Provider(create: (context) => CatsWikiRepository(breedsApiService: context.read())),
        Provider(create: (context) => BreedDetailsSearchRepository(breedDetailsApiService: context.read())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/breed-details') {
            final breedId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => BreedDetailsListPage(breedId: breedId),
            );
          }
          return null;
        },
        routes: {
          '/': (context) => const CatsWikiPage(),
        },
      ),
    );
  }
}
