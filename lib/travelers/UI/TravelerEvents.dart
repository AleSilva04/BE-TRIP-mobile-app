import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_flutter/travelers/UI/TravelerSelectedTravelEvent.dart';

class TravelerEvents extends StatefulWidget {
  const TravelerEvents({Key? key}) : super(key: key);

  @override
  State<TravelerEvents> createState() => _TravelerEventsState();
}

class _TravelerEventsState extends State<TravelerEvents> {
  String url = "https://be-trip-back322.herokuapp.com/api/v1/travel-events";
  List events = [];
  @override
  Widget build(BuildContext context) {
    makeRequest();
    return Scaffold(
      appBar: AppBar(
        title:  Text("Eventos de Viaje Disponibles"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: events.isEmpty? 0 : events.length,
          itemBuilder: (BuildContext context, index) {
            return Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 25),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Evento de viaje ',
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    color: const Color(0xff47455f),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(events[index]['travelerProfilePhotofUrl']),
                                )
                              ],
                            ),
                            Image(
                                image: NetworkImage(events[index]['destinyUrl'])
                            ),
                            Text(
                              events[index]['destiny'],
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 44,
                                color: const Color(0xff47455f),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              events[index]['starting_point'],
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 23,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              events[index]['departure_date'],
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 32),
                            Row(
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const SelectedTravelEvent()));
                                    },
                                    child: Text(
                                      'Know more',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),

                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            );
          },
        ),
      ),
    );
  }

  Future<String> makeRequest() async {
    var response =
        await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});

    setState(() {
      var extractData = jsonDecode(response.body);
      events = extractData['content'];
    });
    return response.body;
  }
}
