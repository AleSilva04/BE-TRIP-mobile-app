import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/screens/screens.dart';
import 'package:mobile_app_flutter/drivers/services/services.dart';
import 'login/UI/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => TravelEventsServices(),lazy: false),
      ],
      child:const MyApp(),
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
      home:EventTravelScreen(),
    );
  }
}
