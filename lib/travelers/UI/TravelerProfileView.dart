import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/travelers/UI/EditProfileEventDialog.dart';
import '../models/UserProfile.dart';
import 'TravelerCreateNewTravelView.dart';
import 'TravelerHome.dart';



class Profile_Traveler extends StatefulWidget {
  const Profile_Traveler({Key? key}) : super(key: key);

  @override
  State<Profile_Traveler> createState() => _Profile_TravelerState();
}

class _Profile_TravelerState extends State<Profile_Traveler> {
   
 

  EditProfileEventDialog? dialog;
  late UserProfile events;

  late UserProfile profileSelected;



  @override
  void initState(){
   
  
    super.initState();
    dialog = EditProfileEventDialog();
    getUser();
     
  }

  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
   getUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: Icon(
              Icons.home,
              color:Colors.white
          ),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TravelerHome()));
          },
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
                              image: NetworkImage(events.pfp)
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 135.0, left:40.0),
                      child: Text(events.name,style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 24.0,

                      )),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 165.0, right:110.0),
                      child: Text(events.email,style: TextStyle(
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
                     showDialog(context: context, builder: (BuildContext context)=>
                        dialog!.buildDialog(
                            context,1,events));

                    },                   
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                    ),
                    child:  const Text("Options",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                    )),                             
                    ),
                
          
                  
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

 Future getUser() async {

    String url3 = "https://be-trip-back322.herokuapp.com";
    url3="$url3/api/v1/travelers/1";
   
    var response = await http.get(Uri.parse(url3), headers: {'Accept': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        events= UserProfile.fromMap(jsonDecode(response.body));
      });
       return UserProfile.fromMap(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load album');
    }


  }



  
}

