import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable()
class Pet {
  int? id;
  String? name;
  String? image;
  int? age;
  bool? adopted;
  String? gender;

  Pet(
      {this.id,
      this.name,
      this.image,
      this.adopted = false,
      this.age,
      this.gender});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);

//   Pet.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         name = json['name'] as String?,
//         adopted = json['adopted'] as bool?,
//         image = json['image'] as String?,
//         age = json['age'] as int?,
//         gender = json['gender'] as String?;
}
