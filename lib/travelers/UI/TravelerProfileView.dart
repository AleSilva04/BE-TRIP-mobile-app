import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/UserProfile.dart';
import 'TravelerCreateNewTravelView.dart';
import 'Traveler_Profile_Edit.dart';


class Profile_Traveler extends StatefulWidget {
  const Profile_Traveler({Key? key}) : super(key: key);

  @override
  State<Profile_Traveler> createState() => _Profile_TravelerState();
}

class _Profile_TravelerState extends State<Profile_Traveler> {
  final String _baseUrl = 'be-trip-back322.herokuapp.com';
  final List<UserProfile> profiles = [];
  late UserProfile profileSelected;

  Future<String> makeRequest() async {
    final url = Uri.https(_baseUrl,'/api/v1/travelers');
    final resp =await http.get(url);
    final Map<String,dynamic> UserProfileMap = json.decode(resp.body);
    List<dynamic> data = UserProfileMap["content"];

    setState(() {
      for(var data in data){
        final temp = UserProfile.fromMap(data);
        profiles.add(temp);
      }
    });

    print(UserProfileMap);
    print("nombre: " + profiles[0].name.toString());
    print("apellido: "+profiles[0].email.toString());
    print("apellido: "+profiles[0].pfp.toString());

    return resp.body;
  }

  @override
  void initState(){
    this.makeRequest();
  }

  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
              color:Colors.white
          ),
          onPressed: (){},
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: (){}
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white60),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profiles[0].pfp.toString())
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 135.0, left:40.0),
                      child: Text(profiles[0].name.toString(),style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 24.0,

                      )),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 165.0, right:110.0),
                      child: Text(profiles[0].email.toString(),style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                      )),
                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context)=> Traveler_newTravel()));

                    },
                    child: Text("New Travel",style: TextStyle(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context)=> Profile_Options()));
                    },
                    child: Text("Options",style: TextStyle(
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

