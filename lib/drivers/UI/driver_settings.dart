import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_profile.dart';



class DriverSettings extends StatefulWidget {
  const DriverSettings({Key? key}) : super(key: key);

  @override
  State<DriverSettings> createState() => _DriverSettingsState();
}

class _DriverSettingsState extends State<DriverSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Profile implemented by me"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(),
        child: ListView(
          children: [
            ElevatedButton(
                
                child: Text("Driver Profile"),
                onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context)=> Profile_Driver()));
                }
            )
          ],
        ),
      ),
    );
  }
}
