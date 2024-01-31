import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:random_dog/modelclasses/api_model_class.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://dog.ceo/api/breeds/image/'));

  Future<Dog?> getpost() async {
    Response response = await dio.get('random');
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return dogFromJson(json);
      }
    } on DioException catch (e) {
      log('error;$e');
    }
    return null;
  }
}
