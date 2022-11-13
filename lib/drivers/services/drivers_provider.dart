import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/drivers/models/driver_routes.dart';
import 'package:mobile_app_flutter/drivers/models/route.dart';

class DriversProvider extends ChangeNotifier {
  //https://be-trip-back322.herokuapp.com/api/v1/drivers/1/driver-routes?page=0
  final String _baseUrl = 'be-trip-back322.herokuapp.com';

  List<DriverRoute> driverRoutes = [];

  DriversProvider() {
    getDriverRoutes();
  }

  getDriverRoutes() async {
    var url =
        Uri.https(_baseUrl, 'api/v1/drivers/1/driver-routes', {'page': '0'});

    final response = await http.get(url);

    final driverRoutesResponse = DriverRoutesResponse.fromJson(response.body);

    driverRoutes = driverRoutesResponse.route;
    notifyListeners();
  }
}
