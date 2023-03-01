import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [];
  // Actions
  Future getPets() async {
    final petsResponse = await DioClient.shared.getPets();
    pets = petsResponse;
    notifyListeners();
  }

  Future addPet(Pet newpet) async {
    await DioClient.shared.addNewPet(newpet);
    // pets = petsData;
    notifyListeners();
  }

  Future editPet(Pet editedPet) async {
    await DioClient.shared.editNewPet(editedPet);
    getPets();
    // pets = petsData;
    notifyListeners();
  }

  void deletePet(int petId) async {
    await DioClient.shared.deletePet(petId);
    pets.removeWhere((pet) => pet.id == petId);
    notifyListeners();
  }
}
