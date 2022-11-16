
import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/models/travel-event.dart';


class TravelEventCard extends StatelessWidget {
  final TravelEvent travelEvent;

  const TravelEventCard({
  Key? key, required this.travelEvent,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Container(
        margin:const EdgeInsets.only(top:30,bottom: 20),
        width: double.infinity,
        height: 350,
        decoration:_cardBoardes(),
        alignment: Alignment.bottomLeft,
        child:Stack(
          children:  [
           
             _BackroundImage(travelEvent.destinyUrl),
             _TravelEventInfo(
              destino: travelEvent.destiny, 
              origen: travelEvent.startingPoint),
        
            

          ],
        )
      ),
    );
  }

  BoxDecoration _cardBoardes() =>  BoxDecoration(
    color: Color.fromARGB(255, 211, 22, 22),
    borderRadius: BorderRadius.circular(20),
   boxShadow:const [
       BoxShadow(
        color:Colors.black,
        offset: Offset(0, 2),
        blurRadius: 10,
     )

    ]
    );
}



class _TravelEventInfo extends StatelessWidget {
  final String destino;
  final String origen;

  const _TravelEventInfo({ 
    required this.destino,
    required this.origen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      
      width: double.infinity,
      height: 70,
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
         Text(

          'Lugar de origen: $origen',
          style: const TextStyle(color:Colors.white,fontStyle: FontStyle.italic, fontSize: 20,),

          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'Lugar de destino: $destino ',
          style: const TextStyle(color:Colors.white,fontStyle: FontStyle.italic, fontSize: 20),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}

class _BackroundImage extends StatelessWidget {
  final String ? url;

  const _BackroundImage(this.url);

  @override
  Widget build(BuildContext context) {
   
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
     

      child: url == null
      ?const Image(
          image: AssetImage('https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png'),
          fit:BoxFit.cover,
        )
        :FadeInImage(
          image: NetworkImage(url!),
          placeholder: const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png'),
          fit: BoxFit.cover,
        ),
        //fit: BoxFit.cover,
      );
  }
}