import 'package:flutter/foundation.dart';

import '../network/responses/breed_info_response.dart';
import '../network/services/breed_info_api_service.dart';
import '../network/services/breeds_api_service.dart';

enum LoadingStatus { loading, completed, error }

class BreedInfoController {
  BreedInfoController({required BreedsApiService breedsApiService, required String breedId})
      : _breedInfoApiService = breedsApiService, _breedId = breedId {
    _loadBreedInfo();
  }
  final String _breedId;
  final BreedsApiService _breedInfoApiService;
  final ValueNotifier<LoadingStatus> loadingStatus =
      ValueNotifier(LoadingStatus.loading);
  final ValueNotifier<BreedInfoResponse?> aboutBreed = ValueNotifier(null);

  void _loadBreedInfo() {
    _breedInfoApiService.getBreedsInfo(_breedId).then((value) {
      aboutBreed.value = value;
      loadingStatus.value = LoadingStatus.completed;
    });
  }
}
