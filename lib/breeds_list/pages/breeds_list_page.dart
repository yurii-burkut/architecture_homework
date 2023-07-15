import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/breeds_search_repository.dart';
import '../breeds_list_controller.dart';
import '../models/breed.dart';

class CatsWikiPage extends StatelessWidget {
  const CatsWikiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BreedsListController(
        repository: context.read<CatsWikiRepository>(),
      ),
      child: const BreedsSuggestionWidget(),
    );
  }
}

class BreedsSuggestionWidget extends StatelessWidget {
  const BreedsSuggestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder(
              valueListenable:
                  context.read<BreedsListController>().loadingStatus,
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
              }),
            ),
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
          onPressedShare: () {
            context.read<BreedsListController>().openUri(breeds[index]);
          },
          onPressedPhoto: () async {
            final controller = context.read<BreedsListController>();
            final images = await controller.findImages(breeds[index]).then((images) =>
            controller.openImages(images, context),
            );
          },
          onPressedMoreDetails: () async {
            print('onPressedMoreDetails called');
            context.read<BreedsListController>().onPressedMoreDetails(breeds[index], context);
            print('After onPressedMoreDetails');  // Дії, які відбуваються при натисканні кнопки "More Details"
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
        const Text('Oops...., something went wrong!'),
        ElevatedButton(
          onPressed: context.read<BreedsListController>().onRetryClicked,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
class BreedCard extends StatelessWidget {
  const BreedCard({
    required this.breed,
    required this.onPressedShare,
    required this.onPressedPhoto,
    required this.onPressedMoreDetails,
    Key? key,
  }) : super(key: key);

  final Breed breed;
  final void Function() onPressedShare;
  final void Function() onPressedPhoto;
  final void Function() onPressedMoreDetails;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
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
            Text(
              breed.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    breed.origin,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: onPressedShare,
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: onPressedPhoto,
                    icon: const Icon(Icons.photo),
                  ),
                  GestureDetector(
                    onTap:  onPressedMoreDetails,
                    child: const Text(
                      'More Details',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
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
