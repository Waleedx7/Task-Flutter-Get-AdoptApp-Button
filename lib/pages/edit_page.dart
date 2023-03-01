import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/edit_form.dart';

class EditPets extends StatelessWidget {
  Pet pets;
  EditPets({required this.pets, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(12),
            child: Center(child: EditFormPet(pets: pets))),
      ),
    );
  }
}
