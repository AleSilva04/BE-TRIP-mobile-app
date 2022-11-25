import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_create_new_route.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_general_routes.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_routes.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_settings.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerEvents.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerRoutes.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerSetting.dart';

import '../screens/event_travel_screen.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  int currentTab = 0;
  final List<Widget> screens = [
    //Eventos
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  //TODO: change current screen to event screen
  Widget currentScreen = const EventTravelScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
       
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Driver_newRoute()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  MaterialButton(
                    
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        //TODO: change to driver events screen
                        currentScreen =
                            const EventTravelScreen(); //Clase Driver Events
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.track_changes_sharp,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Driver-Events',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    
                    minWidth: 20,
                    onPressed: () {
                      
                      setState(() {
                        //TODO: add routes screen
                        currentScreen =
                            const DriverGeneralRoutes(); // Clase Driver Routes
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.route,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Routes',
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            const DriverRoutes(); //Clase Driver My Routes
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.travel_explore,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'My Routes',
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        //TODO: add sdriver settings screen
                        currentScreen =
                            const DriverSettings(); //Clase Driver Settings
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'My Settings',
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
