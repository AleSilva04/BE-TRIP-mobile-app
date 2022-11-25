import 'package:flutter/material.dart';

import 'TravelerProfileView.dart';


class TravelerSettings extends StatefulWidget {
  const TravelerSettings({Key? key}) : super(key: key);

  @override
  State<TravelerSettings> createState() => _TravelerSettingsState();
}

class _TravelerSettingsState extends State<TravelerSettings> {
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
                child: Text("Profile"),
                onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context)=>const Profile_Traveler()));
                }
            )
          ],
        ),
      ),
    );
  }
}
