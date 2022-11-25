import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/login/UI/createDriver.dart';

import 'createTraveler.dart';

class registerBrigde extends StatefulWidget {
  const registerBrigde({Key? key}) : super(key: key);

  @override
  State<registerBrigde> createState() => _registerBrigdeState();
}

class _registerBrigdeState extends State<registerBrigde> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrate en BeTrip"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(),
        child: Center(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child:Image(
                        image: NetworkImage("https://e7.pngegg.com/pngimages/862/633/png-clipart-tourism-travel-visa-passport-travel-tshirt-arm.png")
                    ) ,
                  )
                  ,
                  ElevatedButton(
                      child: const Text("Register as Traveler "),
                      onPressed:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context)=> CreateTraveler()));
                      }
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child:Image(
                        image: NetworkImage("https://w7.pngwing.com/pngs/623/898/png-transparent-car-driving-truck-driver-graphy-driving-glass-driving-truck-thumbnail.png")
                    ),
                  )                  ,
                  ElevatedButton(
                      child: const Text("Register as Driver "),
                      onPressed:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context)=> CreateDriver()));
                      }
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
