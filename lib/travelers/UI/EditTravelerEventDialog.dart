import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/travelers/models/TravelEvent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class EditTravelEventDialog{
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final exdestiny = TextEditingController();
  final exdeparture_date = TextEditingController();
  final exseating = TextEditingController();
  final exstarting_point= TextEditingController();
  final exurltoDestyni= TextEditingController();
  String url = "https://be-trip-back322.herokuapp.com/api/v1/travelers";
  late TravelEvent event3;

  Widget buildDialog(BuildContext context, int id,TravelEvent event) {

    makeRequest(event.id);
    exdestiny.text=event.destiny.toString();
    exurltoDestyni.text=event.destinyUrl.toString();
    exdeparture_date.text=event.departureDate.toString();
    exseating.text=event.seating.toString();
    exstarting_point.text=event.startingPoint.toString();
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
            ),
            TextFormField(
              controller: exurltoDestyni,
              validator: (value){
                return value!.isNotEmpty ? null:"Invalid Field";
              },
              decoration: InputDecoration(
                  hintText: "Enter new url",
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Url",
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
              event.departureDate=exdeparture_date.text;
              event.startingPoint=exstarting_point.text;
              event.destinyUrl=exurltoDestyni.text;
              event3.destiny=event.destiny;
              event3.seating=event.seating;
              event3.departureDate=event.departureDate;
              event3.startingPoint=event.startingPoint;
              event3.destinyUrl=event.destinyUrl;
              update(id, event.id, event3);
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
  Future update(int travelerId,int  eventId, TravelEvent event) async {
    url="$url/$travelerId/travel-events/$eventId";
    var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
  }
  Future<TravelEvent> makeRequest(int id) async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1";
    url="$url/travel-events/$id";
    var response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
        event3=TravelEvent.fromMap2(jsonDecode(response.body));
      return TravelEvent.fromMap2(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }
  }
}