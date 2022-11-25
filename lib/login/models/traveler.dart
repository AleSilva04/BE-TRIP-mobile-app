class Traveler {
    Traveler({
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

    static Traveler objJson(Map<String, dynamic> json){
      return Traveler(
        id: json["id"] as int,
        name: json["name"] as String,
        age: json["age"] as int,
        dni: json["dni"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        phoneNumber: json["phoneNumber"] as String,
        pfp: json["pfp"] as String,
        puntuacion: json["puntuacion"] as int,
      );
    }
}