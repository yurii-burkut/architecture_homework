import 'package:architecture_sample/network/dio_client.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list/pages/breeds_list_page.dart';
import '../network/services/image_api_service.dart';
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
          create: (context) => CatsWikiRepository(
            breedsApiService: context.read(),
            imageApiService: context.read(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(primary: Colors.green, seedColor: Colors.grey).copyWith(background: Colors.grey),
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CatsWikiPage(),
    Text(
      'Favorites',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats API'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
