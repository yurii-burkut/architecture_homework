import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../network/responses/image_response.dart';
import '../breeds_list_page.dart';
import '../../network/services/favorite_image_api_service.dart';

class FavoriteImageScreen extends StatefulWidget {
  const FavoriteImageScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteImageScreen> createState() => _FavoriteImageScreenState();
}

class _FavoriteImageScreenState extends State<FavoriteImageScreen> {
  int _selectedIndex = 1;
  List<MyImage> _favoriteImages = [];
  late FavoriteImageApiService favoriteImageApiService;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CatsWikiPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    favoriteImageApiService =
        Provider.of<FavoriteImageApiService>(context, listen: false);
    favoriteImageApiService.getFavoriteImages("RusPal_123").then((images) {
      setState(() {
        _favoriteImages = List<MyImage>.from(images);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Favorite images"),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: _favoriteImages.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.network(_favoriteImages[index].image!.url!),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print(_favoriteImages[index].id);
                            favoriteImageApiService.deleteFavoriteImage(_favoriteImages[index].id!).then((_) {
                              setState(() {
                                _favoriteImages.removeAt(index);
                              });
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 30,
                            //color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Delete image',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
