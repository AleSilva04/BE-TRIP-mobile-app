import 'package:flutter/material.dart';

/*

class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {

  int currentTab=0;
  final List<Widget> screens=[
    //Eventos
  ];
  final PageStorageBucket bucket= PageStorageBucket();
  Widget currentScreen = //Clase Driver Events
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },
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
                    onPressed: (){
                        setState(() {
                          currentScreen= //Clase Driver Events
                          currentTab=0;
                        });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.track_changes_sharp,
                          color: currentTab==0?Colors.blue:Colors.grey,
                        ),
                        Text(
                          'Travel-Events',
                          style: TextStyle(
                            color: currentTab==0?Colors.blue:Colors.grey,
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: (){
                      setState(() {
                        currentScreen= // Clase Driver Routes
                        currentTab=1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.route,
                          color: currentTab==1?Colors.blue:Colors.grey,
                        ),
                        Text(
                          'See Routes',
                          style: TextStyle(
                              color: currentTab==1?Colors.blue:Colors.grey,
                            fontSize: 10
                          ),
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
                    onPressed: (){
                      setState(() {
                        currentScreen= //Clase Driver My Routes
                        currentTab=2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.travel_explore,
                          color: currentTab==2?Colors.blue:Colors.grey,
                        ),
                        Text(
                          'My Routes',
                          style: TextStyle(
                              color: currentTab==2?Colors.blue:Colors.grey,
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: (){
                      setState(() {
                        currentScreen= //Clase Driver Settings
                        currentTab=3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab==3?Colors.blue:Colors.grey,
                        ),
                        Text(
                          'My Settings',
                          style: TextStyle(
                              color: currentTab==3?Colors.blue:Colors.grey,
                            fontSize: 10
                          ),
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
*/