import 'package:architecture_sample/repositories/breeds_search_repository.dart';
import 'package:architecture_sample/network/services/breed_details_api_service.dart';
import 'package:architecture_sample/network/services/breeds_api_service.dart';
import 'package:architecture_sample/network/services/favorite_image_api_service.dart';
import 'package:architecture_sample/network/services/image_api_service.dart';
import 'package:dio/dio.dart';

const _apiKey = 'live_k7tJBiuMDmyya76j4iomFeHPgupHxDMWOnngUpptPFEdozJSznKHXpvjj0fke9sV';

abstract class DioClient {
  static Dio _client = Dio()
    ..options.baseUrl = 'https://api.thecatapi.com/v1'
    ..options.headers['x-api-key'] = _apiKey
    ..interceptors.add(LogInterceptor());

  static Dio get instance => _client;
}

Future<void> testLoadFavoriteImages() async {
  // Створити екземпляри сервісів, передаючи екземпляр Dio
  final breedsApiService = BreedsApiService(client: DioClient.instance);
  final imageApiService = ImageApiService(client: DioClient.instance);
  final breedDetailsApiService = BreedDetailsApiService(client: DioClient.instance);
  final favoriteImageApiService = FavoriteImageApiService(client: DioClient.instance);

  // Створити репозиторій зі створеними сервісами
  final repository = CatsWikiRepository(
    breedsApiService: breedsApiService,
    imageApiService: imageApiService,
    breedDetailsApiService: breedDetailsApiService,
    favoriteImageApiService: favoriteImageApiService,
  );

  try {
    // Викликати функцію loadFavoriteImages() та отримати результат
    final favoriteImages = await repository.loadFavoriteImages();

    // Вивести результат у консоль
    print('Favorite Images: $favoriteImages');
  } catch (error) {
    print('Error loading favorite images: $error');
  }
}

