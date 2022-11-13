import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/travelers/models/TravelEvent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class EditTravelEventDialog{
  GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final exdestiny = TextEditingController();
  final exdeparture_date = TextEditingController();
  final exseating = TextEditingController();
  final exstarting_point= TextEditingController();
  int userId=1;
  String url = "https://be-trip-back322.herokuapp.com/api/v1";
  late TravelEvent event;
  int asd=0;
  Future<String> makeRequest(int id) async {
    url="$url/travel-events/$id";
    var response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
    var extractData = jsonDecode(response.body);
    asd=extractData['id'];
    return response.body;
  }

  Widget buildDialog(BuildContext context, int id) {
    makeRequest(id);
    exdestiny.text=asd.toString();
    exdeparture_date.text="aaf";
    exseating.text="aaf";
    exstarting_point.text="aaf";
    return AlertDialog(
    title: Text("EDIT YOUR TRAVEL EVENT"),
      content:  Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller: exdestiny,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: InputDecoration(
                  hintText: "Enter New Destiny",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.card_travel_outlined),
                  labelText: "Destiny",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: exdeparture_date,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: InputDecoration(
                  hintText: "Enter Fecha de Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_month),
                  labelText: "Departure Date",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: exseating,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: InputDecoration(
                  hintText: "Enter Asientos",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Seatings",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
            TextFormField(
              controller: exstarting_point,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: InputDecoration(
                  hintText: "Enter Lugar De Salida",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Departure Point",
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se edito exitosamente")));
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

}