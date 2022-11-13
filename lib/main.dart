import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_routes.dart';
import 'package:mobile_app_flutter/drivers/providers/drivers_provider.dart';
import 'package:provider/provider.dart';

import 'login/UI/login.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DriversProvider(), lazy: false,)
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      initialRoute: 'login',
      //home: Login(),
      routes: {
        'login':(context) => const Login(),
        'driverRoutes':(context) => const DriverRoutes(),
      },
    );
  }
}
