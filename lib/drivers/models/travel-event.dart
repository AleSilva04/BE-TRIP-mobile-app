// To parse this JSON data, do
//
//     final travelEvents = travelEventsFromMap(jsonString);

import 'dart:convert';

class TravelEvent {
    TravelEvent({
        this.id,
        this.driverId,
        required this.destiny,
        required this.destinyUrl,
        required this.seating,
        required this.startingPoint,
        required this.departureTime,
        required this.departureDate,
        required this.cost,
        required this.type,
        this.plate,
        this.travelerProfilePhotofUrl,
    });

    int? id;
    int? driverId;
    String destiny;
    String destinyUrl;
    int seating;
    String startingPoint;
    String departureTime;
    DateTime departureDate;
    int cost;
    String type;
    String? plate;
    String? travelerProfilePhotofUrl;

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
        departureDate: DateTime.parse(json["departure_date"]),
        cost: json["cost"],
        type: json["type"],
        plate: json["plate"],
        travelerProfilePhotofUrl: json["travelerProfilePhotofUrl"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "driverId": driverId,
        "destiny": destiny,
        "destinyUrl": destinyUrl,
        "seating": seating,
        "starting_point": startingPoint,
        "departure_time": departureTime,
        "departure_date": "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
        "cost": cost,
        "type": type,
        "plate": plate,
        "travelerProfilePhotofUrl": travelerProfilePhotofUrl,
    };

    TravelEvent copy() => TravelEvent(
    id:id,                     
    driverId:driverId,                  
    destiny:destiny,                                 
    destinyUrl:destinyUrl,                  
    seating:seating,                     
    startingPoint:startingPoint,             
    departureTime:departureTime,                  
    departureDate:departureDate,                 
    cost:cost,                        
    type:type,                        
    plate:plate,                     
    travelerProfilePhotofUrl:travelerProfilePhotofUrl,
    );
}
