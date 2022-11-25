class Driver {
    Driver({  
        required this.id,
        required this.name,
        required this.last_name,
        required this.age,
        required this.dni,
        required this.district,
        required this.email,
        required this.password,
        required this.type,
        required this.model,
        required this.brand,
        required this.license_plate,
        required this.license_code,
        required this.number_seats,
        required this.phoneNumber,
        required this.puntuacion,
        required this.pfp
    });
    int id;
    String name;
    String last_name;
    int age;
    String dni;
    String district;
    String email;
    String password;
    String type;
    String model;
    String brand;
    String license_plate;
    String license_code;
    int number_seats;
    String phoneNumber;
    String pfp;
    int puntuacion;

    static Driver objJson(Map<String, dynamic> json){
      return Driver(
        id: json["id"] as int,
        name: json["name"] as String,
        last_name: json["last_name"] as String,
        age: json["age"] as int,
        dni: json["dni"] as String,
        district: json["district"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        type: json["type"] as String,
        model: json["model"] as String,
        brand: json["brand"] as String,
        license_plate: json["license_plate"] as String,
        license_code: json["license_code"] as String,
        number_seats: json["number_seats"] as int,
        phoneNumber: json["phoneNumber"] as String,
        pfp: json["pfp"] as String,
        puntuacion: json["puntuacion"] as int
      );
  }
}
