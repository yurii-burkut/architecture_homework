import 'package:flutter/foundation.dart';

import '../network/responses/breed_info_response.dart';
import '../network/services/breed_info_api_service.dart';

enum LoadingStatus { loading, completed, error }

class BreedInfoController {
  BreedInfoController({required BreedInfoApiService breedInfoApiService})
      : _breedInfoApiService = breedInfoApiService {
    _loadBreedInfo();
  }

  final BreedInfoApiService _breedInfoApiService;
  final ValueNotifier<LoadingStatus> loadingStatus =
      ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<BreedInfoResponse?> aboutBreed = ValueNotifier(null);

  void _loadBreedInfo() {
    _breedInfoApiService.getBreedsInfo().then((value) {
      aboutBreed.value = value;
      loadingStatus.value = LoadingStatus.completed;
    });
  }
}
