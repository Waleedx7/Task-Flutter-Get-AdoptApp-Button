import 'package:adopt_app/models/pet.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://coded-pets-api-crud.herokuapp.com';

  Future<List<Pet>> getPets() async {
    final response = await _dio.get("$_baseUrl/pets");
    final petsData = response.data as List;
    final pets = petsData.map((petjson) => Pet.fromJson(petjson)).toList();
    return pets;
  }

  Future addNewPet(Pet newpet) async {
    final response = await _dio.post("$_baseUrl/pets", data: newpet.toJson());
  }

  Future editNewPet(Pet editedPet) async {
    await _dio.put("$_baseUrl/pets/${editedPet.id}", data: editedPet.toJson());
  }

  Future deletePet(int Petid) async {
    try {
      await _dio.delete('$_baseUrl/pets/$Petid');
    } on DioError catch (error) {
      print(error);
    }
  }

  static DioClient shared = DioClient._();
  DioClient._();
}
