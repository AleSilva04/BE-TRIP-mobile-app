import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/models/route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class EditDriverRouteDialog{
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  final exdestiny = TextEditingController();
  final exdepartureDate = TextEditingController();
  final exseating = TextEditingController();
  final exstartingPoint= TextEditingController();

  String url = "https://be-trip-back322.herokuapp.com/api/v1/drivers";
  late DriverRoute event3;

  Widget buildDialog(BuildContext context, int id,DriverRoute event) {
    makeRequest(event.id);
    exdestiny.text=event.destiny.toString();
    exdepartureDate.text=event.departureDate.toString();
    exseating.text=event.seating.toString();
    exstartingPoint.text=event.startingPoint.toString();
    return AlertDialog(
    title: const Text("EDIT YOUR DRIVER ROUTE"),
      content:  Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller: exdestiny,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: const InputDecoration(
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
              controller: exdepartureDate,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: const InputDecoration(
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
              decoration: const InputDecoration(
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
              controller: exstartingPoint,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: const InputDecoration(
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
              event.destiny=exdestiny.text;
              event.seating=int.parse(exseating.text);
              event.departureDate=exdepartureDate.text;
              event.startingPoint=exstartingPoint.text;
              event3.destiny=event.destiny;
              event3.seating=event.seating;
              event3.departureDate=event.departureDate;
              event3.startingPoint=event.startingPoint;
              update(id, event.id, event3);
              if(_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se edito exitosamente")));
                Navigator.pop(context);
              }
            },
            child: const Text("Guardar")
        ),
        ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancelar")
        )
      ],
    );
  }
  Future update(int travelerId,int  eventId, DriverRoute event) async {
    url="$url/$travelerId/travel-events/$eventId";
    var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
  }
  
  Future<DriverRoute> makeRequest(int id) async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1";
    url="$url/driver-routes/$id";
    var response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
        event3=DriverRoute.fromMap(jsonDecode(response.body));
      return DriverRoute.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }
  }
}