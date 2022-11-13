class Passenger{
  int id;
  String name;
  int age;
  String dni;
  String email;
  String password;
  String phoneNumber;
  String pfp;
  int puntuacion;

  Passenger(this.id, this.name, this.age, this.dni, this.email, this.password,
      this.phoneNumber, this.pfp, this.puntuacion);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'dni': dni,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'pfp': pfp,
      'puntuacion': puntuacion
    };
  }
}