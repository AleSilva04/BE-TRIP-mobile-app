import 'package:meta/meta.dart';
import 'dart:convert';
class UserProfile {
  UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.dni,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.pfp,
    required this.puntuacion,
  });

  int id;
  String name;
  int age;
  String dni;
  String email;
  String password;
  String phoneNumber;
  String pfp;
  int puntuacion;

  factory UserProfile.fromJson(String str) => UserProfile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    dni: json["dni"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    pfp: json["pfp"],
    puntuacion: json["puntuacion"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "age": age,
    "dni": dni,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "pfp": pfp,
    "puntuacion": puntuacion,
  };
}
