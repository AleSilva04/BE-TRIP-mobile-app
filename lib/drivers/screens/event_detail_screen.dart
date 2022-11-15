import 'package:mobile_app_flutter/drivers/models/travel-event.dart';
import 'package:mobile_app_flutter/drivers/services/travel-events-services.dart';
import 'package:mobile_app_flutter/drivers/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
  final eventService = Provider.of<TravelEventsServices>(context);
    return  _EventDetailBody(eventService: eventService);
  }
}

class _EventDetailBody extends StatelessWidget {
  const _EventDetailBody({
    Key? key,
    required this.eventService,
  }) : super(key: key);

  final TravelEventsServices eventService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Travel Event Detail'),
     ),
     body: SingleChildScrollView(
      child:Column(
        children: [
          Stack(
            children: [
              EventImage(
                departure_date:eventService.selectedEvent.departureDate,
                cost: eventService.selectedEvent.cost, 
                departure_time: eventService.selectedEvent.departureTime, 
                destiny: eventService.selectedEvent.destiny,
                destinyUrl: eventService.selectedEvent.destinyUrl, 
                seating: eventService.selectedEvent.seating,
                starting_point: eventService.selectedEvent.startingPoint,
                id: eventService.selectedEvent.id,
                driverId: eventService.selectedEvent.driverId, 
                type: eventService.selectedEvent.type),
            ],
          ),
         const _EventDetailForm(),
         const SizedBox(height: 100),

        ],
      ),
    ),
    );
  }
}

class _EventDetailForm extends StatelessWidget {
  const _EventDetailForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<TravelEventsServices>(context);
    final eventDetail = eventService.selectedEvent;
    final String destiny = eventDetail.destiny;
    final int seating = eventDetail.seating;
    final String starting_point = eventDetail.startingPoint;
    final String departure_time= eventDetail.departureTime;
    final DateTime departure_date = eventDetail.departureDate;
    final int cost= eventDetail.cost;
    final String type = eventDetail.type;
    final String? plate = eventDetail.plate; 

    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children:[
               const SizedBox(height: 10),
              Text(
                
                 "Destino  : $destiny ",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
               Text(
                 "Asientos  : $seating",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
               Text(
                 "Punto de partida  : $starting_point",
                   style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
               Text(
                 "Hora de Salida  : $departure_time",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
               Text(
                 "Fecha de salida  : $departure_date",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
              Text(
                 "Costo  : $cost",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
              Text(
                 "Tipo  : $type",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              const SizedBox(height: 30),
               Text(
                 "plate  : $plate",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
              
              
              const SizedBox(height: 30),


          ]),
          )

      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.amber,
    borderRadius:const BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        offset: const Offset(0,9),
        blurRadius: 5,
      )
    ]
  );
}