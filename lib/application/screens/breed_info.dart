import 'package:architecture_sample/application/screens/photo_breeds.dart';
import 'package:architecture_sample/application/screens/wiki_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../breeds_list/models/breed.dart';
import 'favourites_image.dart';

class BreedInfo extends StatelessWidget {
  final Breed breed;

  const BreedInfo({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    bool selectionIsActive = false;

    return Scaffold(
      appBar: AppBar(title: const Icon(Icons.pets)),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (breed.imageUrl != null)
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (breed.imageUrl != null)
                            Image.network(
                              breed.imageUrl!,
                              errorBuilder: (context, o, _) => const Icon(
                                Icons.image_not_supported_outlined,
                              ),
                            ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text('Додати в улюблене'),
                              if (breed.url != null)
                                GestureDetector(
                                  child: IconButton(
                                    disabledColor: Colors.blue,
                                    onPressed: () {

                                      //FavouritesImagesCats(breed: breed,).sendPostRequestOn();
                                      },

                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             FavouritesImagesCats(
                                    //               breed: breed,
                                    //             ),
                                    //     ),
                                    //   );
                                    // },
                                    icon: Icon(
                                      Icons.star_border,
                                      color: selectionIsActive
                                          ? null
                                          : Colors.redAccent,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          breed.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${('Origin').toString().toUpperCase()}: ${breed.origin}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${('Temperament').toString().toUpperCase()}:${breed.temperament}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${('Description').toString().toUpperCase()}:${breed.description}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      // 'Metric:${breed.weight!.map((e) => e)}',
                      Center(
                        child: GestureDetector(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewExample(
                                    wikkipediaUrl: '${breed.wikipediaUrl}',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Wikipedia',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumBreeds(
                                    breed: breed,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Photo',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
