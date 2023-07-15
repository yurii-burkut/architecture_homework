import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../breeds_list_controller.dart';
import '../models/breed_details.dart';
import '../widgets/details_card.dart';

class BreedDetailsListWidget extends StatelessWidget {
  const BreedDetailsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final breedsListController = Provider.of<BreedsListController>(context);
    final breedDetailsList = breedsListController.breedDetailsListenable.value;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ValueListenableBuilder<LoadingStatus>(
            valueListenable: breedsListController.loadingStatus,
            builder: (context, value, child) {
              switch (value) {
                case LoadingStatus.loading:
                  return const _BreedDetailsLoading();
                case LoadingStatus.completed:
                  return _BreedDetailsLoaded(breedDetailsList: breedDetailsList);
                case LoadingStatus.error:
                  return const _BreedDetailsLoadingError();
                default:
                  return Container(); // Повернути пустий контейнер для випадку, якщо значення не відповідає жодному зі станів
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BreedDetailsLoading extends StatelessWidget {
  const _BreedDetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class _BreedDetailsLoaded extends StatelessWidget {
  const _BreedDetailsLoaded({required this.breedDetailsList, Key? key}) : super(key: key);

  final List<BreedDetails> breedDetailsList;

  @override
  Widget build(BuildContext context) => ListView.separated(
    itemCount: breedDetailsList.length,
    itemBuilder: (context, index) => BreedDetailsCard(
      breedDetails: breedDetailsList[index],
    ),
    separatorBuilder: (context, index) => const Divider(),
  );
}

class _BreedDetailsLoadingError extends StatelessWidget {
  const _BreedDetailsLoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.warning_amber_outlined, color: Colors.red),
        const Text('Oops, something went wrong!'),
        ElevatedButton(
          onPressed: () => context.read<BreedsListController>().onRetryClicked(),
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
