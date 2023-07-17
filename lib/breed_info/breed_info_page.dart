import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'breeds_info_controller.dart';

class BreedInfoPage extends StatelessWidget {
  const BreedInfoPage(
      {super.key, required this.breedId, required this.imageUrl});

  final String breedId;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BreedInfoController(
          breedsApiService: context.read(),
          breedId: breedId,
          imageUrl: imageUrl),
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
  const Slider({super.key, required value, required title})
      : _value = value,
        _title = title;
  final int? _value;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return (_value != null)
        ? Column(
            children: [
              Text(_title),
              SfSlider(
                  min: 0.0,
                  max: 5.0,
                  value: _value,
                  interval: 1,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    //setState(() {
                    //_value = value;
                  }),
            ],
          )
        : const SizedBox();
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required value, required title})
      : _value = value,
        _title = title;
  final int? _value;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return (_value == 1)
        ? ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 120, height: 30),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      _title),
                )),
          )
        : const SizedBox();
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutBreed = context.read<BreedInfoController>().aboutBreed.value;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            aboutBreed!.name,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(
            context.read<BreedInfoController>().imageUrl,
            errorBuilder: (context, o, _) => const Icon(
              Icons.image_not_supported_outlined,
            ),
          ),
          Text(aboutBreed.description),
          const SizedBox(
            height: 10,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'temperament:',
                style: TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              )),
          Text(
            aboutBreed.temperament ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Slider(
            value: aboutBreed.adaptability,
            title: 'Adaptability',
          ),
          Slider(
            value: aboutBreed.affectionLevel,
            title: 'Affection Level',
          ),
          Slider(
            value: aboutBreed.childFriendly,
            title: 'Child Friendly',
          ),
          Slider(
            value: aboutBreed.dogFriendly,
            title: 'Dog Friendly',
          ),
          Slider(
            value: aboutBreed.energyLevel,
            title: 'Energy Level',
          ),
          Slider(
            value: aboutBreed.grooming,
            title: 'Grooming',
          ),
          Slider(
            value: aboutBreed.healthIssues,
            title: 'Health Issues',
          ),
          Slider(
            value: aboutBreed.intelligence,
            title: 'Intelligence',
          ),
          Slider(
            value: aboutBreed.sheddingLevel,
            title: 'Shedding Level',
          ),
          Slider(
            value: aboutBreed.socialNeeds,
            title: 'Social Needs',
          ),
          Slider(
            value: aboutBreed.strangerFriendly,
            title: 'Stranger Friendly',
          ),
          Slider(
            value: aboutBreed.vocalisation,
            title: 'Vocalisation',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextWidget(
                value: aboutBreed.experimental,
                title: 'Experimental',
              ),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                value: aboutBreed.hairless,
                title: 'Hairless',
              ),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                value: aboutBreed.natural,
                title: 'Natural',
              ),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                value: aboutBreed.rare,
                title: 'Rare',
              ),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                value: aboutBreed.rex,
                title: 'Rex',
              ),
            ],
          ),

        ],
      ),
    );
  }
}
