import 'package:architecture_sample/breeds_details/breeds_details_controller.dart';
import 'package:architecture_sample/breeds_details/models/breeds_details.dart';
import 'package:architecture_sample/breeds_details/models/breeds_image.dart';
import 'package:architecture_sample/breeds_details/widgets/opinion_star.dart';
import 'package:architecture_sample/breeds_details/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../repositories/breeds_search_repository.dart';


class BreedsDetailsPage extends StatelessWidget {
  const BreedsDetailsPage({super.key, required this.breedId});

  final String breedId;


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BreedsDetailsController(
          repository: context.read<CatsWikiRepository>(), breedId: breedId),
      child: const BreedsDetailsSuggestionWidget(),
    );
  }
}


class BreedsDetailsSuggestionWidget extends StatelessWidget {
  const BreedsDetailsSuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text("Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ValueListenableBuilder(
              valueListenable: context.read<BreedsDetailsController>().loadingStatus,
              builder: ((context, value, child) {
                return ValueListenableBuilder(
                    valueListenable: context.read<BreedsDetailsController>().loadingStatusImage,
                    builder: ((context, value, child) {
                      switch (value) {
                        case LoadingStatusImage.loading:
                          return const _BreedsDetailsLoading();
                        case LoadingStatusImage.completed:
                          return _BreedsDetailsLoaded(
                            breedDetails: context.read<BreedsDetailsController>().breedsDetailsListenable.value!,
                          );
                        case LoadingStatusImage.error:
                          return const _BreedsDetailsLoadingError();
                      }
                    })
                );
              })),
        ),
      ),
    );
  }
}

class _BreedsDetailsLoading extends StatelessWidget {
  const _BreedsDetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class _BreedsDetailsLoaded extends StatelessWidget {
  const _BreedsDetailsLoaded({required this.breedDetails, Key? key}) : super(key: key);

  final BreedDetails breedDetails;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 15,
      ),
      ImageScroll(
          breedImage: context.read<BreedsDetailsController>().breedsImageListenable.value,
      ),
          
      const SizedBox(
        height: 15,
      ),
      Expanded(
        child: ListView(

          children: [
            Chip(
                avatar: CircleAvatar(
                  child: ClipOval(
                    child: SvgPicture.network(
                      'https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.1/flags/1x1/${breedDetails?.countryCode!.toLowerCase()}.svg',
                    ),
                  ),
                ),
                label: Text(breedDetails.origin)),
            const SizedBox(
              height: 15,
            ),
            Text(
              breedDetails.name,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              breedDetails.description,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              breedDetails.temperament,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Lifetime ${breedDetails.lifeSpan!} years',
            ),
            const SizedBox(
              height: 15,
            ),
            CharacteristicOpinionStar(characteristic: 'Adaptability', opinion: breedDetails.adaptability,),
            CharacteristicOpinionStar(characteristic: 'Child Friendly', opinion: breedDetails.childFriendly,),
            CharacteristicOpinionStar(characteristic: 'Gog Friendly', opinion: breedDetails.dogFriendly,),
            CharacteristicOpinionStar(characteristic: 'Energy Level', opinion: breedDetails.energyLevel,),
            CharacteristicOpinionStar(characteristic: 'Intelligence', opinion: breedDetails.intelligence,),
            CharacteristicOpinionStar(characteristic: 'Shedding Level', opinion: breedDetails.sheddingLevel,),
            CharacteristicOpinionStar(characteristic: 'Social Needs', opinion: breedDetails.socialNeeds,),
          ],
        ),
      ),

    ],
  );
}

class ImageWidget {
}

class _BreedsDetailsLoadingError extends StatelessWidget {
  const _BreedsDetailsLoadingError({Key? key}) : super(key: key);

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
            onPressed: context.read<BreedsDetailsController>().onRetryClicked,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
