import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/login_model.dart';

abstract class LoginServices {
  Future<LoginModel> postLogin(email, password);
}

class LoginServicesImpl extends LoginServices {
  @override
  Future<LoginModel> postLogin(email, password) async {
    String url = "https://auth.zil.com/api/login/";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "password": password,
      },
      headers: {
        "application-id": "delivery.e_commerce,"
        // "Access-Control-Allow-Origin": "*"
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return LoginModel.fromJson(data);
    } else {
      debugPrint("Error in API Call ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
