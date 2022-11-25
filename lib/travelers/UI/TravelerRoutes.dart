import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../drivers/models/route.dart';
import '../models/Passengers.dart';
import '../models/TravelerRoutes.dart';
import '../models/UserProfile.dart';

class TravelerRoutes extends StatefulWidget {
  const TravelerRoutes({Key? key}) : super(key: key);

  @override
  State<TravelerRoutes> createState() => _TravelerRoutesState();
}

class _TravelerRoutesState extends State<TravelerRoutes> {
  int userId = 1;
  String url = "https://be-trip-back322.herokuapp.com/api/v1/";
  List<TR> routes = [];
  int userId2=1;
  bool isLoading=true;
  late UserProfile user;
  @override
  void initState() {
    super.initState();
    makeRequest();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Rutas Disponibles"),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: routes.isEmpty ? 0 : routes.length,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                    key: Key(routes[index].id.toString()),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Se elimino")));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/005/484/215/original/super-car-logo-free-vector.jpg"),
                      ),
                      title: Text(
                        routes[index].destiny,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            routes[index].startingPoint,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 17,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Passengers:",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 17,
                              color:Colors.white60,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                                itemCount: (routes[index]!.passengers != null)
                                    ? routes[index].passengers.length
                                    : 0,
                                itemBuilder: (BuildContext context, int index2) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(routes[index].passengers[index2].pfp),
                                    ),
                                    title: Text(
                                      routes[index].passengers[index2].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                    tileColor: Colors.blueGrey,
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: (validateUser(user.id, routes[index])==false)?()=>update(routes[index].driverId, routes[index].id, routes[index]):null,
                        child: Text("Unirse"),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      tileColor: Colors.blueGrey,
                      minVerticalPadding: 15.0,
                    )
                );
              }
          )
      ),
    );
  }

  Future<String> makeRequest() async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1/driver-routes";
    var response =
    await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
    final Map<String, dynamic>travelEventMap = jsonDecode(response.body);
    List<dynamic> data = travelEventMap["content"];
    if (response.statusCode == 200) {
      setState(() {
        for (var data in data) {
          final temp = TR.fromMap(data);
          routes.add(temp);
        }
      });
      print(routes);
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future update(int travelerId,int  eventId, TR event) async {
    String url3 = "https://be-trip-back322.herokuapp.com/api/v1/drivers";
    url3="$url3/$travelerId/driver-routes/$eventId";
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
    print(url3);
    event.passengers.add(a);
    print(event.toString());
    var response = await http.put(
        Uri.parse(url3),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
    print(response.body);
  }
  Future getUser() async {

    String url3 = "https://be-trip-back322.herokuapp.com";
    url3="$url3/api/v1/travelers/$userId2";

    var response = await http.get(Uri.parse(url3), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        user=UserProfile.fromMap(jsonDecode(response.body));
      });
      return UserProfile.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }

  }
  bool validateUser(int id1,TR a){
    bool flag=false;
    a.passengers.forEach((element) {
      if(element.id==id1){
        flag= true;
      }
    });
    return flag;
  }
}

