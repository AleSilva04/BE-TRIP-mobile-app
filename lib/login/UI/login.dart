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
        title: Text("LOGIN"),
      ),
body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/betrip.jpg'),
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Arial'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Arial'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      "Ingrese sus credenciales"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "example@gmail.com"
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "*********"
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const TravelerHome()));
                          },
                          child: Icon(Icons.login),
                        ),    
                      ],
                  ),
                  )
              ]
            ),
            )
        ],
      ),
    );
  }
}
