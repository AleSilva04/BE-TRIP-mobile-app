import 'package:mobile_app_flutter/travelers/models/Passengers.dart';

class TravelEvent{
 int driverId;
 String  destiny;
 String destinyUrl;
 int seating;
 String starting_point;
 String departure_time;
 String departure_date;
 int cost;
 String type;
 String plate;
 String travelerProfilePhotofUrl;
 List<Passenger> passengers;
 int id;

 TravelEvent(
      this.driverId,
      this.destiny,
      this.destinyUrl,
      this.seating,
      this.starting_point,
      this.departure_time,
      this.departure_date,
      this.cost,
      this.type,
      this.plate,
      this.travelerProfilePhotofUrl,
      this.passengers,
      this.id);

 Map<String, dynamic> toMap(){
   return{
     'driverId':  id,
     'destiny': destiny,
     'destinyUrl': destinyUrl,
     'seating':  seating,
     'starting_point': starting_point,
     'departure_time': departure_time,
     'departure_date':  departure_date,
     'cost': cost,
     'type': type,
     'plate':  plate,
     'travelerProfilePhotofUrl': travelerProfilePhotofUrl,
     'passengers': passengers,
     'id': id,
   };
 }

}