import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List events = [];
  EditTravelEventDialog? dialog;
  @override
  void initState(){
    dialog = EditTravelEventDialog();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     makeRequest();
     return Scaffold(
       appBar: AppBar(
         title:  Text("Mis Eventos"),
         centerTitle: true,
       ),
      body: Center(
        child: ListView.builder(
        itemCount: events.isEmpty ? 0 : events.length,
         itemBuilder: (BuildContext context, index){
          return Dismissible(
              key: Key(events[index]['id'].toString()),
              onDismissed: (direction){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se elimino")));
              },
              child:  ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(events[index]['destinyUrl']),
                ),
                title: Text(
                  events[index]['destiny'],
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 25,
                    color: const Color(0xff47455f),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  events[index]['starting_point'],
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
                            context,1));

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
  Future<String> makeRequest() async {
    url=url+userId.toString()+"/travel-events";
    var response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});

    setState(() {
      var extractData = jsonDecode(response.body);
      events = extractData['content'];
    });

    return response.body;
  }
}
