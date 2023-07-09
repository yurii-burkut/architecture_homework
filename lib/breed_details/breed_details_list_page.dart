import 'package:architecture_sample/breed_details/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/breeds_datails_search_repository.dart';
import 'models/breed_details.dart';
import 'breed_details_list_controller.dart';

class BreedDetailsListPage extends StatelessWidget {
  const BreedDetailsListPage({Key? key, required this.breedId}) : super(key: key);

  final String breedId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BreedDetailsListController(
        repository: context.read<BreedDetailsSearchRepository>(),
        breedId: breedId,
      ),
      child: const BreedDetailsListWidget(),
    );
  }
}


class BreedDetailsListWidget extends StatelessWidget {
  const BreedDetailsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white10,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ValueListenableBuilder(
            valueListenable: context.read<BreedDetailsListController>().loadingStatus,
            builder: ((context, value, child) {
              switch (value) {
                case LoadingStatus.loading:
                  return const _BreedDetailsLoading();
                case LoadingStatus.completed:
                  return _BreedDetailsLoaded(
                    breedDetailsList: context
                        .read<BreedDetailsListController>()
                        .breedDetailsListenable
                        .value,
                  );
                case LoadingStatus.error:
                  return const _BreedDetailsLoadingError();
              }
            })),
      ),
    ),
  );
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
          onPressed: context.read<BreedDetailsListController>().onRetryClicked,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
