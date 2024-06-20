import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentalhub/users/owner/owner_page.dart';
import 'package:rentalhub/users/tenant/tenant_page.dart';
import 'package:rentalhub/widgets/alert.dart';

class LoginService {
  static Future<void> Login(String emailPhone, String password,
      BuildContext context, String role) async {
    Map<String, dynamic> loginCredentials = {
      "emailPhone": emailPhone,
      "password": password
    };
    final Uri loginUrl = Uri.parse("http://192.168.1.103:7677/rh/login/user");
    final http.Response response = await http.post(
      loginUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(loginCredentials),
    );

    if (response.statusCode == 200) {
      if (role == 'Owner') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OwnerHomePage(),
            ));
      } else if (role == 'Tenant') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TenantHomePage(),
            ));
      }
    } else if (response.statusCode == 500){
      
      // Map<String, dynamic> responseBody = json.decode(response.body);
      // print("\n\n\n$responseBody\n\n\n");
      // String timestamp = responseBody['timestamp'];
      // String error = responseBody['error'];
      // int status = responseBody['status'];

        Alert.showAlert(
        context, 
        "Logging Unsuccessful", 
        "Invalid Credentilas"
        //"Status Code : $status\nError : $error \nTime Stamp : $timestamp\n"
      );
    }
  }
}
