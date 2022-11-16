import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/UI/login.dart';
import 'dart:convert';

import 'package:mobile_app_flutter/travelers/UI/EditTravelerEventDialog.dart';
import 'package:mobile_app_flutter/travelers/models/Passengers.dart';
import 'package:mobile_app_flutter/travelers/models/TravelEvent.dart';

class TravelerMyEvents extends StatefulWidget {
  const TravelerMyEvents({Key? key}) : super(key: key);

  @override
  State<TravelerMyEvents> createState() => _TravelerMyEventsState();
}

class _TravelerMyEventsState extends State<TravelerMyEvents> {
  int userId=1;
  String url = "https://be-trip-back322.herokuapp.com/api/v1/travelers/";
  List<TravelEvent> events = [];
  EditTravelEventDialog? dialog;
  @override
  void initState(){
    dialog = EditTravelEventDialog();
    super.initState();
    makeRequest(1);
  }
  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title:  Text("Mis Eventos"),
         centerTitle: true,
         leading: IconButton(
          
           icon: Icon(
               Icons.logout,
               color:Colors.red
           ),
           onPressed: (){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const Login()));
           },
         ),
       ),
      body: Center(
        child: ListView.builder(
        itemCount: events.isEmpty ? 0 : events.length,
         itemBuilder: (BuildContext context, index){
          return Dismissible(
              key: Key(events[index].id.toString()),
              onDismissed: (direction){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se elimino")));
              },
              child:  ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(events[index].destinyUrl),
                ),
                title: Text(
                  events[index].destiny,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 25,
                    color: const Color(0xff47455f),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  events[index].startingPoint,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 17,
                    color: const Color(0xff47455f),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: FloatingActionButton(
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context)=>
                        dialog!.buildDialog(
                            context,1,events[index]));

                  },
                  child:Icon(Icons.edit) ,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                tileColor: Colors.blueGrey,
                minVerticalPadding: 15.0,
              )
          );
         }
        ),
      ),
    );
  }
  Future<String> makeRequest(id) async {
    url="$url/$id/travel-events";
    var response =
    await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});

    final Map<String,dynamic>travelEventMap=jsonDecode(response.body);
    List<dynamic> data=travelEventMap["content"];
    if (response.statusCode == 200) {
      setState(() {
        for (var data in data){
          final temp=TravelEvent.fromMap(data);
          events.add(temp);
        }
      });
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
