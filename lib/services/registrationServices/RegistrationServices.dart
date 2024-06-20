import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentalhub/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:rentalhub/pages/login_page.dart';

class RegistrationServices {

  static Map<String, dynamic> userData(
      String username,
      String email,
      String location,
      String phone,
      String password,
      String role
  ){
    return User.toJson(username, email, location, phone, password, role);
  }
  
  static Future<void> registerUser(
      String username,
      String email,
      String location,
      String phone,
      String password,
      String role,
      BuildContext context
  ) async{
    Map<String, dynamic> userJsonToBeRegistered = userData(username, email, location, phone, password, role);
    final Uri registrationUrl = Uri.parse('http://192.168.1.103:7677/rh/users/registerUser');
    final http.Response response = await http.post(
      registrationUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userJsonToBeRegistered),
    );

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    }
  }
}