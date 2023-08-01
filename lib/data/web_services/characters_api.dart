import 'package:dio/dio.dart';
import 'package:move/constant/strings.dart';

class CharactersApi {
  late Dio dio;

  // Create Connsction in API
  CharactersApi() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20000, // 20S
      receiveTimeout: 20000, // 20S
    );
    dio = Dio(baseOptions);
  }

  // get All Characters
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
