import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/models/traveler.dart';

class AuthTravelerProvider {
  static Future<bool> validateUser(String email, String password) async {
    //final storage = new FlutterSecureStorage();

    final urlTraveler = Uri.parse(
        "https://be-trip-back322.herokuapp.com/api/v1/travelers/auth/log-in");

    final responseTraveler = await http.post(urlTraveler,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (responseTraveler.statusCode == 200) {
      final decodedResp = json.decode(responseTraveler.body);
      final sample = Traveler.objJson(decodedResp);
      //storage.write(key: 'idUser', value: sample.id.toString());
      //storage.write(key: 'typeUser', value: 'Teacher');
      print('validate Traveler');
      return true;
    } else {
      print('invalid Traveler');
      return false;
    }
  }
}
