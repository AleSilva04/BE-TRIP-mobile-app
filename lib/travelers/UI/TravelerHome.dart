import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_routes.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerEvents.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerMyEvents.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerRoutes.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerSetting.dart';

class TravelerHome extends StatefulWidget {
  const TravelerHome({Key? key}) : super(key: key);

  @override
  State<TravelerHome> createState() => _TravelerHomeState();
}

class _TravelerHomeState extends State<TravelerHome> {
  int currentTab = 0;
  final List<Widget> screens = [
    TravelerEvents(),
    TravelerRoutes(),
    TravelerMyEvents(),
    TravelerSettings()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = TravelerEvents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
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
                        //TODO: delete driver Routes an change to traveler events
                        //currentScreen=TravelerEvents();
                        currentScreen = DriverRoutes();
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
                          'Travel-Events',
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
                        currentScreen = TravelerRoutes();
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
                          'See Routes',
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
                        currentScreen = TravelerMyEvents();
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
                          'My Travel-Events',
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
                        currentScreen = TravelerSettings();
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
