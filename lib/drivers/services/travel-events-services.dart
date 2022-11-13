import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_flutter/drivers/models/travel-event.dart';

class TravelEventsServices extends ChangeNotifier{

  final String _baseUrl ='be-trip-back322.herokuapp.com';
  final List<TravelEvent> travelEvents = [];
  late TravelEvent selectedEvent;
 
  bool isLoading = true;

  TravelEventsServices(){
    loadTravelEvents();
  }



  Future<List<TravelEvent>> loadTravelEvents() async{

      isLoading = true;


      final url = Uri.https(_baseUrl,'/api/v1/travel-events');
      final resp = await http.get( url );

      final Map<String,dynamic> travelEventMap = json.decode(resp.body);
      List<dynamic> data = travelEventMap["content"];

      for (var data in data) {
          final temp = TravelEvent.fromMap(data);
          //temp.id = key as int?;
          travelEvents.add(temp);
      }
      isLoading = false;
      notifyListeners();
     
      return travelEvents;
  }
  
 
}