import 'package:dio/dio.dart';

const _apiKey = 'live_n4d5FPV0uY0Br4loCo13WbraocoWtDv8jm3zlqw4iCvmShOAuxT9NDHeaUwYcEoB';

abstract class DioClient {
  static Dio? _client;

  static Dio get instance => _client ??= Dio()
    ..options.baseUrl = 'https://api.thecatapi.com/v1'
    ..options.headers['x-api-key'] = _apiKey
    ..interceptors.add(LogInterceptor());
}
