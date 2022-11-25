// To parse this JSON data, do
//
//     final driver = driverFromMap(jsonString);

import 'dart:convert';

class Driver {
    Driver({
        required this.id,
        required this.name,
        required this.lastName,
        required this.age,
        required this.dni,
        required this.district,
        required this.email,
        required this.password,
        required this.type,
        required this.model,
        required this.brand,
        required this.licencePlate,
        required this.licenceCode,
        required this.numberSeats,
        required this.phoneNumber,
        required this.puntuacion,
        required this.pfp,
    });

    int id;
    String name;
    String lastName;
    int age;
    String dni;
    String district;
    String email;
    String password;
    String type;
    String model;
    String brand;
    String licencePlate;
    String licenceCode;
    int numberSeats;
    String phoneNumber;
    int puntuacion;
    String pfp;

    factory Driver.fromJson(String str) => Driver.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Driver.fromMap(Map<String, dynamic> json) => Driver(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        age: json["age"],
        dni: json["dni"],
        district: json["district"],
        email: json["email"],
        password: json["password"],
        type: json["type"],
        model: json["model"],
        brand: json["brand"],
        licencePlate: json["licence_plate"],
        licenceCode: json["licence_code"],
        numberSeats: json["number_seats"],
        phoneNumber: json["phoneNumber"],
        puntuacion: json["puntuacion"],
        pfp: json["pfp"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "age": age,
        "dni": dni,
        "district": district,
        "email": email,
        "password": password,
        "type": type,
        "model": model,
        "brand": brand,
        "licence_plate": licencePlate,
        "licence_code": licenceCode,
        "number_seats": numberSeats,
        "phoneNumber": phoneNumber,
        "puntuacion": puntuacion,
        "pfp": pfp,
    };
}
