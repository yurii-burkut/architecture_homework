
import 'package:flutter/foundation.dart';

import '../repositories/breeds_search_repository.dart';
import '../breeds_details/models/breeds_details.dart';
import '../breeds_details/models/breeds_image.dart';

enum LoadingStatus { loading, completed, error }
enum LoadingStatusImage { loading, completed, error }
enum LoadingStatusFlag { loading, completed, error }

class BreedsDetailsController {
  BreedsDetailsController({required CatsWikiRepository repository, required breedId})
      : _repository = repository, _breedId = breedId {
    _loadBreedsDetail();
    _loadBreedsImage();
  }

  final String _breedId;



  final CatsWikiRepository _repository;

  final ValueNotifier<LoadingStatus> loadingStatus =
  ValueNotifier(LoadingStatus.loading);

  final ValueNotifier<LoadingStatusImage> loadingStatusImage =
  ValueNotifier(LoadingStatusImage.loading);

  final ValueNotifier<LoadingStatusFlag> loadingStatusFlag =
  ValueNotifier(LoadingStatusFlag.loading);

  final ValueNotifier<BreedDetails?> breedsDetailsListenable = ValueNotifier<BreedDetails?>(null);
  final ValueNotifier<List<BreedImage>> breedsImageListenable = ValueNotifier([]);
  final ValueNotifier<String> breedsFlagListenable = ValueNotifier('');


  void _loadBreedsDetail() async {
   await  _repository.loadBreedsDetails(_breedId).then((value) {
      breedsDetailsListenable.value = value;
      loadingStatus.value = LoadingStatus.completed;
    });
  }

  void _loadBreedsImage()  {
    _repository.loadBreedsImage(_breedId).then((value) {
      breedsImageListenable.value = value;
      loadingStatusImage.value = LoadingStatusImage.completed;
    }).onError((error, stackTrace) {
      loadingStatusImage.value = LoadingStatusImage.error;
    });
  }

  void postFavourite(String imageId) async {
    await _repository.postFavourite(imageId);
  }

  void onRetryClicked() {
    _loadBreedsDetail();
    _loadBreedsImage();
  }


}