import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../network/services/breed_info_api_service.dart';
import 'breeds_info_controller.dart';

class BreedInfoPage extends StatelessWidget {
  const BreedInfoPage({super.key, required this.breedId});

  final String breedId;

  @override
  Widget build(BuildContext context) {
    return
        Provider(
          create: (context) => BreedInfoController(breedsApiService: context.read(), breedId: breedId),
          child: const BreedInfoWidget(),
        );
  }
}

class BreedInfoWidget extends StatelessWidget {
  const BreedInfoWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable:
                    context.read<BreedInfoController>().loadingStatus,
                builder: ((context, value, child) {
                  switch (value) {
                    case LoadingStatus.loading:
                      return const Text('not now');
                    case LoadingStatus.completed:
                      return const InfoWidget();
                    case LoadingStatus.error:
                      return const Text('error');
                  }
                }),
              )),
        ),
      );
}

class Slider extends StatelessWidget {
  const Slider({super.key, required value}): _value = value;
  final int? _value;

  @override
  Widget build(BuildContext context) {
    return (_value != null)
      ? SfSlider(
      min: 0.0,
      max: 5.0,
      value: _value,
      interval: 1,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value){
        //setState(() {
          //_value = value;
        }) : const SizedBox();
      }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.name),
        Text(context
            .read<BreedInfoController>()
            .aboutBreed
            .value!
            .description),
        Text(context
            .read<BreedInfoController>()
            .aboutBreed
            .value
            ?.temperament ?? ''),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.adaptability),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.affectionLevel),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.childFriendly),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.dogFriendly),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.energyLevel),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.grooming),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.healthIssues),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.intelligence),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.sheddingLevel),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.socialNeeds),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.strangerFriendly),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.vocalisation),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.experimental),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.hairless),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.natural),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.rare),
        Slider(value: context
            .read<BreedInfoController>()
            .aboutBreed
            .value!.rex),
      ],
    );
  }
}


