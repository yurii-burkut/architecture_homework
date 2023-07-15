import 'package:dio/dio.dart';

class FavouritesApiServis {
  const FavouritesApiServis({required Dio client}) : _client = client;

  final Dio _client;

  void sendPostRequest() async {
    try {
      Dio dio = Dio();
      Response response = await _client.post('favourites',
        data: {'image_id': 'BkIEhN3pG',
          'sub_id': 'my-user-1234'},
      );

      print(response.data);
      return (response.data);
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