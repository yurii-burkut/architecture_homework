
import 'package:dio/dio.dart';

import '../responses/favourite_response.dart';


const _subId = 'VitalikTestKovtiukh';

class FavouriteApiService {
  const FavouriteApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<FavouriteResponse>> getFavourite() async {
    final response = await _client.get('/favourite', queryParameters:{ 'sub_id': _subId});

    return (response.data as Iterable)
        .map((element) =>
        FavouriteResponse.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<void> postFavourite(String imageId) async{
      await _client.post('/favourites', data: {'image_id': imageId, 'sub_id': _subId});

  }

  Future<void> deleteFavourite(int favouriteId) async {
    await _client.delete('/favourites/$favouriteId');
  }




}