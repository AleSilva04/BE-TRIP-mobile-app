import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/models/traveler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTravelerProvider {
  static Future<bool> validateUser(String email, String password) async {

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

    final userId = await SharedPreferences.getInstance();
    final userName = await SharedPreferences.getInstance();

    if (responseTraveler.statusCode == 200) {
      final decodedResp = json.decode(responseTraveler.body);
      final sample = Traveler.objJson(decodedResp);
      await userId.setInt('userId', sample.id);
      await userName.setString('userName', sample.name);
      print(userId.getInt('userId'));
      print(userName.getString('userName'));
      print('validate Traveler');
      return true;
    } else {
      print('invalid Traveler');
      return false;
    }
  }
}
