import 'package:architecture_sample/breeds_list/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/breeds_search_repository.dart';
import 'breeds_list_controller.dart';
import 'models/breed.dart';
import 'breed_details_page.dart';

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
  Widget build(BuildContext context) {
    final controller = context.read<BreedsListController>();

    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ValueListenableBuilder<LoadingStatus>(
            valueListenable: controller.loadingStatus,
            builder: (context, value, child) {
              switch (value) {
                case LoadingStatus.loading:
                  return const _BreedsLoading();
                case LoadingStatus.completed:
                  return _BreedsLoaded(
                    breeds: controller.breedsListenable.value,
                    onBreedCardPressed: (breed) {
                      controller.openBreedDetailsPage(context, breed);
                    },
                  );
                case LoadingStatus.error:
                  return const _BreedsLoadingError();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BreedsLoading extends StatelessWidget {
  const _BreedsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class _BreedsLoaded extends StatelessWidget {
  const _BreedsLoaded({
    required this.breeds,
    required this.onBreedCardPressed,
    Key? key,
  }) : super(key: key);

  final List<Breed> breeds;
  final void Function(Breed breed) onBreedCardPressed;

  @override
  Widget build(BuildContext context) => ListView.separated(
    itemCount: breeds.length,
    itemBuilder: (context, index) => BreedCard(
      breed: breeds[index],
      onPressed: () {
        onBreedCardPressed(breeds[index]);
      },
    ),
    separatorBuilder: (context, index) => const Divider(),
  );
}

class _BreedsLoadingError extends StatelessWidget {
  const _BreedsLoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<BreedsListController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.warning_amber_outlined, color: Colors.red),
        const Text('Oops, something went wrong!'),
        ElevatedButton(
          onPressed: controller.onRetryClicked,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
