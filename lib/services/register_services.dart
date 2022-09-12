import 'package:flutter/cupertino.dart';
import '../Models/Register_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class RegisterServices {
  Future<RegisterModel> postRegister(
      firstName, lastName, email, phoneNumber, password, password2);
}

class RegisterServicesImpl extends RegisterServices {
  @override
  Future<RegisterModel> postRegister(
      firstName, lastName, email, phoneNumber, password, password2) async {
    String url = 'https://auth.zil.com/api/register/';
    var response = await http.post(
      Uri.parse(url),
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "password2": password2,
      },
      headers: {
        "application-id": "delivery.e_commerce",
      },
    );
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      return RegisterModel.fromJson(data);
    } else {
      debugPrint("Error in API Call ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
