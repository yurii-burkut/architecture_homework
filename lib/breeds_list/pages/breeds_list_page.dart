import 'package:architecture_sample/breeds_list/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/breeds_search_repository.dart';
import '../breeds_list_controller.dart';
import '../models/breed.dart';
import 'favorites_list_page.dart';

class CatsWikiPage extends StatelessWidget {
  const CatsWikiPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: const Text('About Cats'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<BreedsListController>().loadFavoriteImagesUrls();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const FavoritesImagesPage()),
                );
              },
              icon: const Icon(Icons.favorite),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder(
                valueListenable:
                    context.read<BreedsListController>().loadingStatusBreeds,
                builder: ((context, value, child) {
                  switch (value) {
                    case LoadingStatus.loading:
                      return const _BreedsLoading();
                    case LoadingStatus.completed:
                      return _BreedsLoaded(
                        breeds: context
                            .read<BreedsListController>()
                            .breedsListenable
                            .value,
                      );
                    case LoadingStatus.error:
                      return const _BreedsLoadingError();
                  }
                })),
          ),
        ),
      );
}

class _BreedsLoading extends StatelessWidget {
  const _BreedsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

class _BreedsLoaded extends StatelessWidget {
  const _BreedsLoaded({required this.breeds, Key? key}) : super(key: key);

  final List<Breed> breeds;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: breeds.length,
        itemBuilder: (context, index) => BreedCard(
          breed: breeds[index],
          onPressed: () async {
            // context.read<BreedsListController>().openUri(breeds[index]);
            final controller = context.read<BreedsListController>();
            await controller
                .findImages(breeds[index])
                .then((images) => controller.openImages(images, context));
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
      );
}

class _BreedsLoadingError extends StatelessWidget {
  const _BreedsLoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.warning_amber_outlined, color: Colors.red),
        const Text('Oops, something went wrong!'),
        ElevatedButton(
          onPressed: context.read<BreedsListController>().onRetryClicked,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
