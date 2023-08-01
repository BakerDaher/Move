import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:move/constant/strings.dart';

class QuatoAPi {
  late Dio dio;

  // Create Connsction in API
  QuatoAPi() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: quoteURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20000, // 20S
      receiveTimeout: 20000, // 20S
    );
    dio = Dio(baseOptions);
  }

  // get All Characters
  Future<Map<String, dynamic>> getRandomeQuote() async {
    try {
      Response response = await dio.get("advice");
      return json.decode(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }

  void close(){
    dio.close() ;
  }
}
