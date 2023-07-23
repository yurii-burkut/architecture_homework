
import 'package:dio/dio.dart';


class FlagApiService {
  const FlagApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<dynamic> getFlag(String countryCode) async {
    final response = await _client.get('https://www.countryflagicons.com/FLAT/64/$countryCode.png');

    print(response.data);
    return response.data.toString();
  }
}
