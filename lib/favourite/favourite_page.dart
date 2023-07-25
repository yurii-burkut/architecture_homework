import 'package:architecture_sample/favourite/favourite_controller.dart';
import 'package:architecture_sample/favourite/models/favourite.dart';
import 'package:architecture_sample/favourite/widget/FavouriteCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list/breeds_list_page.dart';
import '../repositories/breeds_search_repository.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => FavouriteController(
            repository: context.read<CatsWikiRepository>(),
        ),
      child: const FavouriteSuggestionWidget(),
    );
  }
}

class FavouriteSuggestionWidget extends StatelessWidget {
  const FavouriteSuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white10,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ValueListenableBuilder(
            valueListenable:
            context.read<FavouriteController>().loadingStatus,
            builder: ((context, value, child) {
              switch (value) {
                case LoadingStatus.loading:
                  return const _FavouriteLoading();
                case LoadingStatus.completed:
                  return _FavouriteLoaded(
                    favourites: context
                        .read<FavouriteController>()
                        .favouriteListenable
                        .value,
                  );
                case LoadingStatus.error:
                  return const _FavouriteLoadingError();
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FavouritePage()));
            },
          ),
        ],
      ),

    ),
  );
}

class _FavouriteLoading extends StatelessWidget {
  const _FavouriteLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class _FavouriteLoaded extends StatelessWidget {
  const _FavouriteLoaded({required this.favourites, Key? key}) : super(key: key);

  final List<Favourite> favourites;

  @override
  Widget build(BuildContext context) =>  GridView.builder(
    padding: EdgeInsets.all(8.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: favourites.length,
    itemBuilder: (context, index) => FavouriteCard(
      favourite: favourites[index],
      onPressed: () {
        context.read<FavouriteController>().deleteFavourite(favourites[index]);
      },
    ),
  );
}

class _FavouriteLoadingError extends StatelessWidget {
  const _FavouriteLoadingError({Key? key}) : super(key: key);

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
            onPressed: context.read<FavouriteController>().onRetryClicked,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
