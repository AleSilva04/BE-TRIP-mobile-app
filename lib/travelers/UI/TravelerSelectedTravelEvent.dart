import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectedTravelEvent extends StatefulWidget {
  const SelectedTravelEvent({Key? key}) : super(key: key);

  @override
  State<SelectedTravelEvent> createState() => _SelectedTravelEventState();
}

class _SelectedTravelEventState extends State<SelectedTravelEvent> {

  @override
  Widget build(BuildContext context) {
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
                              image: NetworkImage("https://www.turiweb.pe/wp-content/uploads/2020/10/piura-playa-201020.jpg"),
                             // color: Colors.amber.withOpacity(0.8),
                              width: 400,
                            ),
                          ),
                          Divider(height: 10,thickness: 10,color: Colors.black,),
                          Text(
                            "PIURA",
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
                                    Text("San miguel")
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
                                    Text("12-12-22")
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
                                    Text("12")
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
                                    Text("12")
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on_outlined,size: 30,),
                                    Text("Pasajeros:",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.person,color: Colors.green,),
                                      title:Text("Juan Perez",style: TextStyle(

                                          fontWeight: FontWeight.bold
                                      ),),
                                      tileColor: Colors.blueGrey,
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.person,color: Colors.green),
                                      title:Text("Adrian Perez",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                      ) ,
                                      tileColor: Colors.blueGrey,
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Se Unio exitosamente")));
                                          Navigator.pop(context);
                                          },
                                        child: Text("Unirse")),
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancelar")),

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
}
