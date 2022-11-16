import 'package:mobile_app_flutter/drivers/screens/screens.dart';
import 'package:mobile_app_flutter/drivers/services/travel-events-services.dart';
import 'package:mobile_app_flutter/drivers/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EventTravelScreen extends StatelessWidget {
  const EventTravelScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final travelEventService = Provider.of<TravelEventsServices>(context);

    if(travelEventService.isLoading) return  const LoadingScreen();

    return Scaffold(
     appBar: AppBar(
      title: const Text('Travel Events'),
     ),
     body: ListView.builder(
      itemCount: travelEventService.travelEvents.length,
      itemBuilder:(BuildContext contex, int index )=>  GestureDetector(
        onTap: () {
          travelEventService.selectedEvent = travelEventService.travelEvents[index].copy();
           Navigator.push(
            contex,
            MaterialPageRoute(builder: (contex) =>const EventDetailScreen())
           );
           },
        child: TravelEventCard(
          travelEvent: travelEventService.travelEvents[index],
          ),
        
      ),
     ),
    
   );
  }
}