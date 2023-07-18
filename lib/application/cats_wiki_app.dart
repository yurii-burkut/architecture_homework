import 'package:architecture_sample/network/dio_client.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list/breeds_list_page.dart';
import '../breeds_list/favorites_page.dart';
import '../repositories/breeds_search_repository.dart';

class CatsWikiApp extends StatelessWidget {
  const CatsWikiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioClient.instance),
        Provider(create: (context) => BreedsApiService(client: context.read())),
        Provider(
            create: (context) =>
                CatsWikiRepository(breedsApiService: context.read()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CatsWikiHomePage(),
      ),
    );
  }
}

class CatsWikiHomePage extends StatefulWidget {
  const CatsWikiHomePage({Key? key}) : super(key: key);

  @override
  _CatsWikiHomePageState createState() => _CatsWikiHomePageState();
}

class _CatsWikiHomePageState extends State<CatsWikiHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CatsWikiPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
