import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/drivers/models/driver_routes.dart';
import 'package:mobile_app_flutter/drivers/models/route.dart';

class DriversProvider extends ChangeNotifier {
  //https://be-trip-back322.herokuapp.com/api/v1/drivers/1/driver-routes?page=0
  final String _baseUrl = 'be-trip-back322.herokuapp.com';

  List<DriverRoute> driverRoutes = [];
  List<DriverRoute> generalRoutes = [];

  DriversProvider() {
    getDriverRoutes();
    getGeneralRoutes();
  }

  Future<String> _getJsonData(String endpoint) async {
    var url = Uri.https(_baseUrl, endpoint, {'page': '0'});

    final response = await http.get(url);

    return response.body;
  }

  getDriverRoutes() async {
    final jsonData = await _getJsonData('api/v1/drivers/1/driver-routes');

    final driverRoutesResponse = DriverRoutesResponse.fromJson(jsonData);

    driverRoutes = driverRoutesResponse.route;
    notifyListeners();
  }

  getGeneralRoutes() async {
    final jsonData = await _getJsonData('api/v1/driver-routes');

    final driverRoutesResponse = DriverRoutesResponse.fromJson(jsonData);

    generalRoutes = driverRoutesResponse.route;
    notifyListeners();
  }
}
