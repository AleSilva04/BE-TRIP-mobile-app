import 'package:mobile_app_flutter/travelers/models/Passengers.dart';
import 'dart:convert';
class TravelEvent {


  int id;
  int driverId;
  String destiny;
  String destinyUrl;
  int seating;
  String startingPoint;
  String departureTime;
  String departureDate;
  int cost;
  String type;
  String? plate;
  String travelerProfilePhotofUrl;
  List<Passenger>? passengers;

  TravelEvent({
    required this.id,
    required this.driverId,
    required this.destiny,
    required this.destinyUrl,
    required this.seating,
    required this.startingPoint,
    required this.departureTime,
    required this.departureDate,
    required this.cost,
    required this.type,
    this.plate,
    required this.travelerProfilePhotofUrl,
    this.passengers,
  });
  factory TravelEvent.fromJson(String str) => TravelEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelEvent.fromMap(Map<String, dynamic> json) => TravelEvent(
    id: json["id"],
    driverId: json["driverId"],
    destiny: json["destiny"],
    destinyUrl: json["destinyUrl"],
    seating: json["seating"],
    startingPoint: json["starting_point"],
    departureTime: json["departure_time"],
    departureDate: json["departure_date"],
    cost: json["cost"],
    type: json["type"],
    plate: json["plate"],
    travelerProfilePhotofUrl: json["travelerProfilePhotofUrl"],
  );

  factory TravelEvent.fromMap2(Map<String, dynamic> json) => TravelEvent(
    id: json["id"],
    driverId: json["driverId"],
    destiny: json["destiny"],
    destinyUrl: json["destinyUrl"],
    seating: json["seating"],
    startingPoint: json["starting_point"],
    departureTime: json["departure_time"],
    departureDate: json["departure_date"],
    cost: json["cost"],
    type: json["type"],
    plate: json["plate"],
    travelerProfilePhotofUrl: json["travelerProfilePhotofUrl"],
    passengers: List<Passenger>.from(json["passengers"].map((x) => Passenger.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "driverId": driverId,
    "destiny": destiny,
    "destinyUrl": destinyUrl,
    "seating": seating,
    "starting_point": startingPoint,
    "departure_time": departureTime,
    "departure_date": departureDate,
    "cost": cost,
    "type": type,
    "plate": plate,
    "travelerProfilePhotofUrl": travelerProfilePhotofUrl,
    "passengers": List<dynamic>.from(passengers!.map((x) => x.toMap())),
  };
}
