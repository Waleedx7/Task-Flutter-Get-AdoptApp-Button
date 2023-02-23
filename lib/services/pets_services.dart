import 'package:adopt_app/models/pet.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://coded-pets-api-crud.herokuapp.com/pets';

  Future<List<Pet>> getPets() async {
    final response = await _dio.get("$_baseUrl");
    final petsData = response.data as List;
    final pets = petsData.map((e) => Pet.fromJson(e)).toList();
    return pets;
  }
}
