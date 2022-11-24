import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Passengers.dart';
import '../models/TravelEvent.dart';
import 'TravelerHome.dart';

class Traveler_newTravel extends StatefulWidget {
  const Traveler_newTravel({Key? key}) : super(key: key);

  @override
  State<Traveler_newTravel> createState() => _Traveler_newTravelState();
}

class _Traveler_newTravelState extends State<Traveler_newTravel> {

  bool isObscuredPassword = true;
   GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  String url = "https://be-trip-back322.herokuapp.com/api/v1/travelers";
  final exdestiny = TextEditingController();
  final destinyUrl = TextEditingController();
  final exseating = TextEditingController();
  final exstarting_point= TextEditingController();
  final departure_time= TextEditingController();
  final departure_date= TextEditingController();
  final excost= TextEditingController();
  final extype= TextEditingController();
  final explate= TextEditingController();
  bool nice=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Creación de Viaje'),
        actions: [
          Image(image: NetworkImage("https://astelus.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada.jpg")
            ,height: 30,)
        ],
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
              color:Colors.white
          ),
          onPressed: (){},
        ),


      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: exdestiny,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Destiny",
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
                      controller: destinyUrl,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Destiny URL",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Destiny Url",
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
                          hintText: "Enter Seatings",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Seatingd",
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
                      decoration: const InputDecoration(
                          hintText: "Enter Starting Point",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Starting Point",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                    TextFormField(
                      controller: departure_time,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Departure Time",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Departure Time",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                    TextFormField(
                      controller: departure_date,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Departure Date",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Departure Date",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                    TextFormField(
                      controller: excost,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Posible Cost by Passenger",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Enter Cost",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                    TextFormField(
                      controller: extype,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Type of Travel Event",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Enter Type",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                    TextFormField(
                      controller: explate,
                      validator: (value){
                        return value!.isNotEmpty ? null:"Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Plate",
                          border:InputBorder.none,
                          prefixIcon: Icon(Icons.card_travel_outlined),
                          labelText: "Enter Plate",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const TravelerHome()));
                    },
                    child: Text("Cancel",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  ElevatedButton(
                    onPressed:(){
                      createFunction();
                    },
                    child: Text("Crear",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                    )),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future create(int travelerId, TravelEvent event) async {

    var response = await http.post(
        Uri.parse("$url/$travelerId/travel-events"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson2()
    );
    print(response.body);
  }
  void createFunction(){
    TravelEvent a=TravelEvent(
        destiny: exdestiny.text.toString(),
        destinyUrl: destinyUrl.text.toString(),
        seating: int.parse(exseating.text),
        startingPoint: exstarting_point.text.toString(),
        departureTime: departure_time.text.toString(),
        departureDate: departure_date.text.toString(),
        cost: int.parse(exseating.text),
        type: extype.text.toString(),
        driverId: -1, id: 0,
        travelerProfilePhotofUrl: 'https://www.sopitas.com/wp-content/uploads/2022/05/perrito-cheems-esta-enfermo-meme.png');
    a.plate=explate.text.toString();
    a.passengers=List.empty();
    create(1, a);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TravelerHome()));
  }


}
