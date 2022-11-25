import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/UI/login.dart';
import 'package:mobile_app_flutter/login/models/PostTraveler.dart';

class CreateTraveler extends StatefulWidget {
  const CreateTraveler({Key? key}) : super(key: key);

  @override
  State<CreateTraveler> createState() => _CreateTravelerState();
}

class _CreateTravelerState extends State<CreateTraveler> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final exname = TextEditingController();
  final exage = TextEditingController();
  final exdni = TextEditingController();
  final exusername = TextEditingController();
  final exemail = TextEditingController();
  final expassword = TextEditingController();
  final exphone = TextEditingController();
  final expfp = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creación de Viaje'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: exname,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter name",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exage,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Age",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Age",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exdni,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter DNI",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "DNI",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exusername,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Username",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exemail,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Email",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: expassword,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Password",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Departure Date",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exphone,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter PhoneNumber",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Enter PhoneNumber",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: expfp,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter pfp",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "PFP",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          Row(
                            children: [
                            Checkbox(
                            checkColor: Colors.white,
                            fillColor:  MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const Login()));
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
                          onPressed:
                          (isChecked)?()=>createFunction():null
                          ,
                          child: Text("Crear",style: TextStyle(
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
                )
            )
        )
    );
  }
  Future create( PostTraveler event) async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1/travelers";
    var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );

  }
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
  void validateAll(){

  }
  void createFunction(){
    PostTraveler a=PostTraveler(
        name: exname.text.toString(),
        age: int.parse(exage.text),
        dni: exdni.text.toString(),
        username: exusername.text.toString(),
        email: exemail.text.toString(),
        password: expassword.text.toString(),
        phoneNumber: exphone.text.toString(),
        pfp: expfp.text.toString(),
        puntuacion: 0);

    create(a);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Login()));
  }
}
