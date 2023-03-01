import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/pet.dart';

class EditFormPet extends StatefulWidget {
  Pet pets;
  EditFormPet({required this.pets, Key? key}) : super(key: key);

  @override
  State<EditFormPet> createState() => _EditFormPetState();
}

class _EditFormPetState extends State<EditFormPet> {
  final _formKey = GlobalKey<FormState>();
  var name = '';
  var age = 0;
  var gender = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: widget.pets.name,
            decoration: const InputDecoration(
              hintText: 'Pet Name',
            ),
            validator: (value) =>
                value!.isEmpty ? "Name shouldn't be empty" : null,
            onSaved: (newValue) => name = newValue!,
          ),
          TextFormField(
            initialValue: "${widget.pets.age}",
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Pet Age',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a Age";
              } else if (double.tryParse(value) == null) {
                return "Please enter a number";
              }
              return null;
            },
            onSaved: (newValue) => age = int.parse(newValue!),
          ),
          TextFormField(
            initialValue: widget.pets.gender,
            decoration: const InputDecoration(hintText: 'Pet Gender'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a gender.';
              } else if (value != 'male' && value != 'female') {
                return 'Please enter a valid gender (male or female).';
              }
              return null;
            },
            onSaved: (newValue) => gender = newValue!,
          ),
          ElevatedButton(
              onPressed: () {
                _formKey.currentState!.validate();
                _formKey.currentState!.save();
                context.read<PetsProvider>().editPet(
                      Pet(
                        id: widget.pets.id,
                        name: name,
                        age: age,
                        gender: gender,
                      ),
                    );
                context.pop();
              },
              child: Text('Edit Pet'))
        ],
      ),
    );
  }
}
