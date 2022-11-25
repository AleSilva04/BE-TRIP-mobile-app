import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_app_flutter/travelers/models/Passengers.dart';

import 'dart:convert';

import '../../drivers/screens/loading_screen.dart';
import '../models/TravelEvent.dart';

import 'Profile_User_Selected_By_Travel.dart';
import 'TravelerProfileView.dart';


class SelectedTravelEvent extends StatefulWidget {
  final int id;
  SelectedTravelEvent(this.id);

  @override
  State<SelectedTravelEvent> createState() => _SelectedTravelEventState(this.id);
}

class _SelectedTravelEventState extends State<SelectedTravelEvent> {
  final int id;
  _SelectedTravelEventState(this.id);

  late TravelEvent event;
  //late int userId;
  bool isPassenger=false;
  int userId2=1;
  bool isLoading=true;
  late Passenger user;
  @override
  void initState() {
    super.initState();
    makeRequest(this.id);
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    makeRequest(this.id);
    validateUser();
    getUser();
    if(isLoading) return  const LoadingScreen();

    return Scaffold(
      body:Center(
        child: Container(
          height: 800,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.cyan[900]!,
                Colors.cyan[700]!,
              ],
            )
          ),
          child: ClipRRect(
            borderRadius:BorderRadius.circular(30),
            child: CustomPaint(
              size:Size(700,400),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child:Icon(Icons.crisis_alert_rounded)
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Image(
                              image: NetworkImage(event.destinyUrl),
                             // color: Colors.amber.withOpacity(0.8),
                              width: 400,
                            ),
                          ),
                          Divider(height: 10,thickness: 10,color: Colors.black,),
                          Text(
                           event.destiny,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.train,size: 30,),
                                    Text("Lugar de Salida:",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                    Text(event.startingPoint)
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.date_range,size: 30,),
                                    Text("Fecha de Salida:",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                    Text(event.departureDate)
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.event_seat,size: 30,),
                                    Text("Asientos:",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                    Text(event.seating.toString())
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on_outlined,size: 30,),
                                    Text("costo:",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                    Text(event.cost.toString())
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.person,size: 30,),
                                    Text("Pasajeros:",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                  itemCount: (event.passengers != null)? event.passengers?.length : 0,
                                  itemBuilder: (BuildContext context, int index){
                                    return  ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(event.passengers![index].pfp),
                                      ),
                                      title:Text(event.passengers![index].name,style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      ),
                                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> Profile_User_Select(index)));},
                                      tileColor: Colors.blueGrey,
                                    );
                                  }
                                  ),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: (isPassenger==false)?()=>update(userId2, event.id, event):null,
                                        child: Text("Unirse")),
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancelar")),
                                    ElevatedButton(

                                        onPressed: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context)=> Profile_User_Select(0)));
                                        },
                                        child: Text("Client Profile")),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
  Future<TravelEvent> makeRequest(int id) async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1";
    url="$url/travel-events/$id";
    var response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        event=TravelEvent.fromMap2(jsonDecode(response.body));
        isLoading=false;
      });
      return TravelEvent.fromMap2(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }
  }
  void validateUser(){
    event.passengers!.forEach((element) {
      if(element.id==userId2){
        isPassenger=true;
      }
    });
  }
  Future update(int travelerId,int  eventId, TravelEvent event) async {
    String url3 = "https://be-trip-back322.herokuapp.com/api/v1/travelers";
    url3="$url3/$travelerId/travel-events/$eventId";
    Passenger a=Passenger(
        id: user.id,
        name: user.name,
        age: user.age,
        dni: user.dni,
        email: user.email,
        password: user.password,
        phoneNumber: user.phoneNumber,
        pfp: user.pfp,
        puntuacion: user.puntuacion,
        createAt: "createAt",
        updateAt: "updateAt");
    event.passengers!.add(a);
    print(event.toJson());
    var response = await http.put(
        Uri.parse(url3),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
  }
  Future getUser() async {

    String url3 = "https://be-trip-back322.herokuapp.com";
    url3="$url3/api/v1/travelers/$userId2";

    var response = await http.get(Uri.parse(url3), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        user=Passenger.fromMap(jsonDecode(response.body));
      });
      return Passenger.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }

  }
}
