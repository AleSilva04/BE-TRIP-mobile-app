import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/login/models/driver.dart';

class AuthProvider {
  static Future<bool> validateUser(String email, String password) async {
    //final storage = new FlutterSecureStorage();

    final urlDriver = Uri.parse(
        "https://be-trip-back322.herokuapp.com/api/v1/drivers/auth/log-in");

    final responseDriver = await http.post(urlDriver,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (responseDriver.statusCode == 200) {
      final decodedResp = json.decode(responseDriver.body);
      final sample = Driver.objJson(decodedResp);
      //storage.write(key: 'idUser', value: sample.id.toString());
      //storage.write(key: 'typeUser', value: 'Driver');
      print('validate Driver');
      return true;
    }else {
      return false;
      // throw Exception('Failed to validate user');
    }
  }
}
