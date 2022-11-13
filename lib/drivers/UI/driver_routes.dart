import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/main.dart';

class DriverRoutes extends StatelessWidget {
  const DriverRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shadowColor: Colors.indigo,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const FadeInImage(placeholder: AssetImage('assets/jar-loading.gif'), image: NetworkImage('https://img.freepik.com/foto-gratis/tiro-angulo-alto-carretera-vacia-noruega-rodeada-arboles-colinas_181624-20135.jpg?w=2000'),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Destino:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    Text('asdasd', style: TextStyle(fontSize: 16),),
                                  ],
                              ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Hora de partida:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    Text('12:2', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Asientos:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    Text('5', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                            ],
                          ), 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text('Punto de partida:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text('asdasdasdasd', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text('Día de partida:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text('12/1/5', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Costo:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text('12', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                            
                            },
                            child: const Text('Editar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                            
                            }, 
                            child: const Text('Eliminar')
                          )
                        ],
                      )
                    ],
                  ),
                  

                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
