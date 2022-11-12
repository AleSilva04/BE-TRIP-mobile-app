import 'package:flutter/material.dart';


class TravelerEvents extends StatefulWidget {
  const TravelerEvents({Key? key}) : super(key: key);

  @override
  State<TravelerEvents> createState() => _TravelerEventsState();
}

class _TravelerEventsState extends State<TravelerEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text("EVENTS "),
      ),
    );
  }
}
