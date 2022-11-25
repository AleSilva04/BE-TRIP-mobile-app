import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/models/PostDriver.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart';

class CreateDriver extends StatefulWidget {
  const CreateDriver({Key? key}) : super(key: key);

  @override
  State<CreateDriver> createState() => _CreateDriverState();
}

class _CreateDriverState extends State<CreateDriver> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final exname = TextEditingController();
  final exlast_name = TextEditingController();
  final exage = TextEditingController();
  final exdni = TextEditingController();
  final exdistrict = TextEditingController();
  final exemail = TextEditingController();
  final expassword = TextEditingController();
  final extype = TextEditingController();
  final exmodel = TextEditingController();
  final exbrand = TextEditingController();
  final exlicence_plate = TextEditingController();
  final exlicence_code = TextEditingController();
  final exnumber_seats = TextEditingController();
  final exphoneNumber = TextEditingController();
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
                            controller: exlast_name,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter LastName",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "LastName",
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
                            controller: exdistrict,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter District",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "District",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ) ,
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
                            controller: extype,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Type",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Enter Type",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exmodel,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Model",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Model",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exbrand,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Brand",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Brand",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exlicence_plate,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter license plate",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "license plate",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exlicence_code,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter licence code",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "licence code",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exnumber_seats,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Number seats ",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "Number seats",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                          TextFormField(
                            controller: exphoneNumber,
                            validator: (value){
                              return value!.isNotEmpty ? null:"Invalid Field";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter phone number",
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.card_travel_outlined),
                                labelText: "phone number",
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
                                labelText: "Model",
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
                              ),
                              Text("Al crear cuenta aceptas nuestros "),
                              TextButton(onPressed:
                                    (){
                                      String link="https://xfernando43.github.io/BETRIP-LANDING_PAGE/#Servicios";
                                      _launchURL(link);
                                    }
                                  ,
                                  child: Text("TERMS AND CONDITIONS",style: TextStyle(
                                    fontSize: 9
                                  ),))
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
  Future create(PostDriver event) async {
    String url = "https://be-trip-back322.herokuapp.com/api/v1/drivers";
    var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: event.toJson()
    );
    print(response.body);
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
    PostDriver a=PostDriver(
        name: exname.text.toString(),
        lastName: exlast_name.text.toString(),
        age: int.parse(exage.text),
        dni: exdni.text.toString(),
        district: exdistrict.text.toString(),
        email: exemail.text.toString(),
        password: expassword.text.toString(),
        type: extype.text.toString(),
        model: exmodel.text.toString(),
        brand: exbrand.text.toString(),
        licencePlate: exlicence_plate.text.toString(),
        licenceCode: exlicence_code.text.toString(),
        numberSeats: int.parse(exnumber_seats.text),
        phoneNumber: exphoneNumber.text.toString(),
        puntuacion: 0,
        pfp: expfp.text.toString());

    create(a);
   Navigator.push(context,
      MaterialPageRoute(builder: (context) => const Login()));
  }

  Future<void> _launchURL(String url) async {

    if(!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }
}
