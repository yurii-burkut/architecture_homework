import 'package:flutter/foundation.dart';

import '../repositories/breeds_datails_search_repository.dart';
import 'models/breed_details.dart';

class BreedDetailsListController {
  BreedDetailsListController({required BreedDetailsSearchRepository repository, required String breedId})
      : _repository = repository,
        _breedId = breedId {
    _loadBreedDetails();
  }

  final BreedDetailsSearchRepository _repository;
  final String _breedId;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<List<BreedDetails>> breedDetailsListenable =
  ValueNotifier([]);

  void _loadBreedDetails() {
    _repository.loadBreedDetails(_breedId).then((value) {
      breedDetailsListenable.value = [value]; // Визначте, чи повинен бути список або один екземпляр
      loadingStatus.value = LoadingStatus.completed;
    }).onError((error, stackTrace) {
      loadingStatus.value = LoadingStatus.error;
    });
  }

  void onRetryClicked() {
    _loadBreedDetails();
  }
}

enum LoadingStatus { loading, completed, error }
