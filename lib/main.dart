import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/screens/screens.dart';
import 'package:mobile_app_flutter/drivers/services/services.dart';
import 'package:mobile_app_flutter/drivers/services/drivers_provider.dart';
import 'package:provider/provider.dart';
import 'login/UI/login.dart';

void main() {
  runApp(AppState());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DriversProvider(), lazy: false,),
      ChangeNotifierProvider(create: (context) => TravelEventsServices(), lazy: false,)
    ],
    child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.green
      ),
      home: const Login(),
    );
  }
}
