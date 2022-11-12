import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerHome.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN GOING TO BE EDIT BY WILLIAMS"),
      ),
      body: Center(
        child: Text("LOGIN BY WILLIAMS"),
      ),
      floatingActionButton: FloatingActionButton(
       onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TravelerHome()));
       },
      child: Icon(Icons.login),
      ),
    );
  }
}
