import 'package:architecture_sample/breeds_list/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_details/breeds_details_page.dart';
import '../favourite/favourite_page.dart';
import '../repositories/breeds_search_repository.dart';
import 'breeds_list_controller.dart';
import 'models/breed.dart';

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
        backgroundColor: Colors.grey[400],
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
                })),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 50.0,
          color: Colors.white10,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CatsWikiPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavouritePage()));
                },
              ),
            ],
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
          onPressed: () {
            context.read<BreedsListController>().openUri(breeds[index]);
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
      );
}

class _BreedsLoadingError extends StatelessWidget {
  const _BreedsLoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
      ),
    );
  }
}
