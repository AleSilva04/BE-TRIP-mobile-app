
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_flutter/drivers/models/passenger.dart';
import 'package:mobile_app_flutter/drivers/models/travel-event.dart';

class EventDetailService extends ChangeNotifier{
  final String _baseUrl ='be-trip-back322.herokuapp.com';
  final List<TravelEvent> travelEvents = [];
  final List<Passenger> passengers = [];
  //final id = travelEvents[0].id;
  bool isLoading = true;
  int id = 1;
 EventDetailService(){
    loadEventDetail();
  }



//TODO <List<TravelEvent>>

  Future<List<Passenger>> loadEventDetail() async{

      isLoading = true;

      final url = Uri.https(_baseUrl,'/api/v1/travel-events/$id');
      final resp = await http.get( url );

      final Map<String,dynamic> eventDetailMap = json.decode(resp.body);
      List<dynamic> data = eventDetailMap["passengers"];

        for (var data in data) {
          final tempPassenger = Passenger.fromMap(data);
          //temp.id = key as int?;
          passengers.add(tempPassenger);
      }
      isLoading = false;
      notifyListeners();
     
      return passengers;
  }
  
  /**TODO fetch of travel events*/
}