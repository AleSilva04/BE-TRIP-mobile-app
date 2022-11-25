import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/models/drivers.dart';

import 'package:mobile_app_flutter/travelers/models/TravelEvent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_flutter/travelers/models/UserProfile.dart';

class EditDriverProfileDialog{
  GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  final name_ = TextEditingController();
  final last_name_ = TextEditingController();
  final age_ = TextEditingController();
  final dni_= TextEditingController();
  final district_= TextEditingController();
  final email_= TextEditingController();
  final password_ = TextEditingController();
  //final type_ = TextEditingController();
  //final model_ = TextEditingController();
  //final brand_ = TextEditingController();
  //final licence_plate_ = TextEditingController();
  //final licence_code_ = TextEditingController();
  //final number_seats_ = TextEditingController();
  //final phoneNumber_ = TextEditingController();
  final puntuacion_ = TextEditingController();
  final pfp_ = TextEditingController();



  String url = "https://be-trip-back322.herokuapp.com/api/v1/drivers";
  late Driver event3; 

  Widget buildDialog(BuildContext context, int id,Driver event) {
    makeRequest(event.id,  event);
    name_.text=event.name.toString();
    last_name_.text=event.lastName.toString();
     pfp_.text=event.pfp.toString();
    age_.text=event.age.toString();
    dni_.text=event.dni.toString();
    district_.text=event.district.toString();
    email_.text=event.email.toString();
    password_.text=event.password.toString();
    //type_.text=event.puntuacion.toString();
    //model_.text=event.puntuacion.toString();
    //licence_plate_.text=event.puntuacion.toString();
    //licence_code_.text=event.puntuacion.toString();
    //number_seats_.text=event.puntuacion.toString();
    //phoneNumber_.text=event.puntuacion.toString();
    puntuacion_.text=event.puntuacion.toString();
   
    


    return AlertDialog(
    title: Text("EDIT YOUR TRAVEL EVENT"),
      content:  Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller: name_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter New Destiny",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.card_travel_outlined),
                  labelText: "Name",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: last_name_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Last name",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.card_travel_outlined),
                  labelText: "LastName",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: age_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Asientos",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "age",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: dni_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Dni",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: district_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Distrito",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "distrito ",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: email_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "email",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "email",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: password_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "password",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "password",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
           /* TextFormField(
              controller: type_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: model_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: brand_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: licence_plate_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: licence_code_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: number_seats_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: phoneNumber_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),*/
            TextFormField(
              controller: puntuacion_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "puntuación",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "puntuación",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
             TextFormField(
              controller: pfp_,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "UrlImage",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "UrlImage",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            )
          ],
        ),

      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: (){
              event.name=name_.text;
              event.lastName=last_name_.text;
              event.age=int.parse(age_.text);
              event.dni=dni_.text;
              event.district=district_.text;
              event.email=email_.text;
              event.password=password_.text;

              
    
              event.pfp=pfp_.text;

              update(event.id, event);
              if(_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se edito exitosamente")));
                Navigator.pop(context);
              }
            },
            child: Text("Guardar")
        ),
        ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancelar")
        )
      ],
    );
  }
  Future update(int  eventId, Driver event) async {
   
    url="$url/${event.id}";
    var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
      print(event.toMap());
  }
  Future<Driver> makeRequest(int id, Driver event) async {
     print("entrando");
    String url = "https://be-trip-back322.herokuapp.com/api/v1";
    url="$url/drivers/$id";
    final response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
      print(url);
    if (response.statusCode == 200) {
      event = Driver.fromMap(jsonDecode(response.body));
      return Driver.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }
   
  }
}