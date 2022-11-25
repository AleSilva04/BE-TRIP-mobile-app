import 'dart:convert';

import 'package:mobile_app_flutter/travelers/models/Passengers.dart';

class TR {
  TR({
    required this.id,
    required this.driverId,
    required this.destiny,
    required this.seating,
    required this.startingPoint,
    required this.departureTime,
    required this.departureDate,
    required this.cost,
    required this.passengers,
  });

  int id;
  int driverId;
  String destiny;
  int seating;
  String startingPoint;
  String departureTime;
  String departureDate;
  int cost;
  List<Passenger> passengers;

  factory TR.fromJson(String str) =>
      TR.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TR.fromMap(Map<String, dynamic> json) => TR(
    id: json["id"],
    driverId: json["driverId"],
    destiny: json["destiny"],
    seating: json["seating"],
    startingPoint: json["starting_point"],
    departureTime: json["departure_time"],
    departureDate: json["departure_date"],
    cost: json["cost"],
    passengers: List<Passenger>.from(json["passengers"].map((x) => Passenger.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "driverId": driverId,
    "destiny": destiny,
    "seating": seating,
    "starting_point": startingPoint,
    "departure_time": departureTime,
    "departure_date": departureDate,
    "cost": cost,
    "passengers": List<dynamic>.from(passengers!.map((x) => x.toMap())),
  };
}
