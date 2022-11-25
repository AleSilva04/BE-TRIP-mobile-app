// To parse this JSON data, do
//
//     final postTraveler = postTravelerFromMap(jsonString);

import 'dart:convert';

class PostTraveler {
  PostTraveler({
    required this.name,
    required this.age,
    required this.dni,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.pfp,
    required this.puntuacion,
  });

  String name;
  int age;
  String dni;
  String username;
  String email;
  String password;
  String phoneNumber;
  String pfp;
  int puntuacion;

  factory PostTraveler.fromJson(String str) => PostTraveler.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostTraveler.fromMap(Map<String, dynamic> json) => PostTraveler(
    name: json["name"],
    age: json["age"],
    dni: json["dni"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    pfp: json["pfp"],
    puntuacion: json["puntuacion"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "age": age,
    "dni": dni,
    "username": username,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "pfp": pfp,
    "puntuacion": puntuacion,
  };
}
