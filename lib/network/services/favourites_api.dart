import 'package:architecture_sample/network/responses/post_response.dart';
import 'package:dio/dio.dart';

class FavouritesApiServis {
  const FavouritesApiServis({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<PostResponse>?> sendPostRequest(String image_id) async {
    try {
      Dio dio = Dio();
      Response response = await _client.post('/favourites',
        data: {
          'image_id': '$image_id',
          'sub_id': 'vasiliyRich'},
      );
      print(response.data);
      return (response.data as Iterable)
          .map((element) =>
          PostResponse.fromJson(element as Map<String, dynamic>))
          .toList();
    } catch (error) {
      print(error.toString());
    }
  }

  // Future <List<String>> postFavourite() async {
  //   final response = await _client.post('favourites',
  //       data: {'image_id': '9ccXTANkb',
  //              'sub_id': 'my-user-1234'},
  //   );
  //
  //   print(response.data);
  //   return (response.data);


    // return (response.data as Iterable)
    //     .map((element) =>
    //     BreedResponse.fromJson(element as Map<String, dynamic>))
    //     .toList();
  //}
}