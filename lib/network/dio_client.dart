import 'package:dio/dio.dart';

const _apiKey = 'live_k7tJBiuMDmyya76j4iomFeHPgupHxDMWOnngUpptPFEdozJSznKHXpvjj0fke9sV';

abstract class DioClient {
  static Dio? _client;

  static Dio get instance => _client ??= Dio()
    ..options.baseUrl = 'https://api.thecatapi.com/v1'
    ..options.headers['x-api-key'] = _apiKey
    ..interceptors.add(LogInterceptor());
}
