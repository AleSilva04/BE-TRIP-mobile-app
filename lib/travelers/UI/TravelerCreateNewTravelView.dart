import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TravelerHome.dart';

class Traveler_newTravel extends StatefulWidget {
  const Traveler_newTravel({Key? key}) : super(key: key);

  @override
  State<Traveler_newTravel> createState() => _Traveler_newTravelState();
}

class _Traveler_newTravelState extends State<Traveler_newTravel> {

  bool isObscuredPassword = true;

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
              buildTextFild("Fecha de Viaje", "2022-12-12", false),
              buildTextFild("Cantidad de Pasajeros", "10", false),
              buildTextFild("Hora de Salida", "4:00 am", false),
              buildTextFild("Lugar de Recojo", "Jr. Hernando Lurin", false),
              buildTextFild("Metodo de Pago", "Tarjeta", false),
              buildTextFild("Costo por Asiento", "250", false),
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
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const TravelerHome()));
                    },
                    child: Text("Reservar",style: TextStyle(
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


  Widget buildTextFild(String labelText, String placeHolder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscuredPassword: false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
              onPressed: (){},
            ): null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:Colors.grey
            )
        ),
      ),
    );
  }

}
