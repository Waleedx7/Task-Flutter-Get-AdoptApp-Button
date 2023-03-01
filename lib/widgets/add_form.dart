import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pet.dart';

class AddFormPet extends StatefulWidget {
  const AddFormPet({Key? key}) : super(key: key);

  @override
  State<AddFormPet> createState() => _AddFormPetState();
}

class _AddFormPetState extends State<AddFormPet> {
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
            decoration: const InputDecoration(
              hintText: 'Pet Name',
            ),
            validator: (value) =>
                value!.isEmpty ? "Name shouldn't be empty" : null,
            onSaved: (newValue) => name = newValue!,
          ),
          TextFormField(
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
                context.read<PetsProvider>().addPet(Pet(
                      name: name,
                      age: age,
                      gender: gender,
                    ));
              },
              child: Text('Add Pet'))
        ],
      ),
    );
  }
}
