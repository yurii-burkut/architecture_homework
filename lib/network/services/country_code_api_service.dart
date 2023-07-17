
import 'package:dio/dio.dart';


class FlagApiService {
  const FlagApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<String> getFlag(String countryCode) async {
    final response = await _client.get('https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.1/flags/1x1/${countryCode.toLowerCase()}.svg');

    return response.data.toString();
  }
}
