import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/services/breed_info_api_service.dart';
import 'breeds_info_controller.dart';

class BreedInfoPage extends StatelessWidget {
  const BreedInfoPage({super.key, required this.breedId});

  final String breedId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) =>
              BreedInfoApiService(client: context.read(), breedId: breedId),
        ),
        Provider(
          create: (context) => BreedInfoController(breedInfoApiService: context.read()),
        )
      ],
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
                      return Text(context
                          .read<BreedInfoController>()
                          .aboutBreed
                          .value!
                          .description);
                    case LoadingStatus.error:
                      return const Text('error');
                  }
                }),
              )),
        ),
      );
}
