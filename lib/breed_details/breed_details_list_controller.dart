import 'package:flutter/foundation.dart';

import '../repositories/breeds_datails_search_repository.dart';
import 'models/breed_details.dart';

class BreedDetailsListController {
  BreedDetailsListController({
    required this.repository,
    required this.breedId,
  }) {
    _loadBreedDetails();
  }

  final BreedDetailsSearchRepository repository;
  final String breedId;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<List<BreedDetails>> breedDetailsListenable =
  ValueNotifier([]);

  Future<void> _loadBreedDetails() async {
    try {
      loadingStatus.value = LoadingStatus.loading;

      final breedDetails = await repository.loadBreedDetails(breedId);

      breedDetailsListenable.value = [breedDetails];
      loadingStatus.value = LoadingStatus.completed;
    } catch (error) {
      breedDetailsListenable.value = [];
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void onRetryClicked() {
    _loadBreedDetails();
  }
}

enum LoadingStatus { loading, completed, error }
