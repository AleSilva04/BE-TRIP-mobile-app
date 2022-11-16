import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/models/route.dart';
import 'package:mobile_app_flutter/drivers/services/drivers_provider.dart';
import 'package:mobile_app_flutter/drivers/widgets/route_card.dart';
import 'package:provider/provider.dart';

class DriverGeneralRoutes extends StatelessWidget {
  const DriverGeneralRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    final driversProvider = Provider.of<DriversProvider>(context);
    final List<DriverRoute> routes = driversProvider.generalRoutes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes'),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          final route = routes[index];
          return RouteCard(route: route, button: false);
        },
      ),
    );
  }
}
