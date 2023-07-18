import 'package:architecture_sample/network/dio_client.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../breeds_list/pages/breeds_list_page.dart';
import '../breeds_list/pages/favourite_images_page.dart';
import '../network/services/favourite_api_service.dart';
import '../network/services/image_api_service.dart';
import '../repositories/breeds_search_repository.dart';

class CatsWikiApp extends StatefulWidget {
  const CatsWikiApp({Key? key}) : super(key: key);

  @override
  _CatsWikiAppState createState() => _CatsWikiAppState();
}

class _CatsWikiAppState extends State<CatsWikiApp> {
  int _selectedIndex = 0;

  final List<Widget Function()> _widgetOptions = [
        () => CatsWikiPage(),
        () => FavouriteImagesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioClient.instance),
        Provider(create: (context) => BreedsApiService(client: context.read())),
        Provider(create: (context) => ImageApiService(client: context.read())),
        Provider(create: (context) => FavouriteApiService(client: context.read())),
        Provider(
            create: (context) =>
                CatsWikiRepository(breedsApiService: context.read(),
                                   imageApiService: context.read(),
                                   favouriteApiService: context.read() ))
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
        home: Scaffold(
          backgroundColor: Colors.black26,
          body: _widgetOptions.elementAt(_selectedIndex).call(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
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
          ),
        ),
      ),
    );
  }
}
