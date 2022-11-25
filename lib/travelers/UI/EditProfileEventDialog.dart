import 'package:flutter/material.dart';

import 'package:mobile_app_flutter/travelers/models/TravelEvent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_flutter/travelers/models/UserProfile.dart';

class EditProfileEventDialog{
  GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  final nameEdited = TextEditingController();
  final ageEdited = TextEditingController();
  final dniEdited = TextEditingController();
  final emailEdited= TextEditingController();
  final passwordEdited= TextEditingController();
  final phoneNumberEdited= TextEditingController();
  final pfpEdited = TextEditingController();
  final puntuacionEdited = TextEditingController();

  String url = "https://be-trip-back322.herokuapp.com/api/v1/travelers";
  late UserProfile event3; 

  Widget buildDialog(BuildContext context, int id,UserProfile event) {
    makeRequest(event.id, event);
    nameEdited.text=event.name.toString();
    ageEdited.text=event.age.toString();
    dniEdited.text=event.dni.toString();
    emailEdited.text=event.email.toString();
    passwordEdited.text=event.password.toString();
    phoneNumberEdited.text=event.phoneNumber.toString();
    pfpEdited.text=event.pfp.toString();
    puntuacionEdited.text=event.puntuacion.toString();
    return AlertDialog(
    title: Text("EDIT YOUR TRAVEL EVENT"),
      content:  Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter New Destiny",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.card_travel_outlined),
                  labelText: "Name",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            TextFormField(
              controller: ageEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter age",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_month),
                  labelText: "Age Date",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: dniEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Asientos",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Seatings",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: emailEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: passwordEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: phoneNumberEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: pfpEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: puntuacionEdited,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration:const InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
                  labelStyle: TextStyle(
                      fontSize: 15,
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
              event.name=nameEdited.text;
              event.age=int.parse(ageEdited.text);
              event.dni=dniEdited.text;
              event.email=emailEdited.text;
              event.password=event.password;
              event.phoneNumber=phoneNumberEdited.text;
              event.pfp=pfpEdited.text;
              event.puntuacion=int.parse(puntuacionEdited.text);
              update(event.id,event);
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
  Future update(int  eventId, UserProfile event) async {
  
    url="$url/$eventId";
    var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
  }
  Future<UserProfile> makeRequest(int id, UserProfile events) async {
     print("entrando");
    String url = "https://be-trip-back322.herokuapp.com/api/v1";
    url="$url/travelers/$id";
    final response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
      print(url);
    if (response.statusCode == 200) {
      events = UserProfile.fromMap(jsonDecode(response.body));
      return  UserProfile.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }
   
  }
}