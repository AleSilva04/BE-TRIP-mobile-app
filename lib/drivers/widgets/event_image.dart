

import 'package:flutter/material.dart';


class EventImage extends StatelessWidget {
    final int? id;
    final int? driverId;
    final String destiny;
    final String destinyUrl;
    final int seating;
    final String starting_point;
    final String departure_time;
    final DateTime departure_date;
    final int cost;
    final String type;
    final String? plate;

  const EventImage({super.key, required this.id, this.driverId, required this.destiny, required this.destinyUrl, required this.seating, required this.starting_point, required this.departure_time, required this.departure_date, required this.cost, required this.type, this.plate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 10, right: 10, top: 40),
      child: Container(
      decoration: _buildBoxDecoration(),
      width: double.infinity,
      height: 450,
      child:  ClipRRect(
        borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: destinyUrl == null
        ? const Image(
          image: AssetImage('https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png'),
          fit:BoxFit.cover,
        )
        :FadeInImage(
          image: NetworkImage(destinyUrl),
          placeholder:const AssetImage('https://www.citypng.com/public/uploads/preview/loading-load-icon-transparent-png-11639609114lctjenyas8.png'),
          fit: BoxFit.cover,
        ),
        
      ),
     ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.amberAccent,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    boxShadow:  [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0,5)
      ),
    ]
  );
}