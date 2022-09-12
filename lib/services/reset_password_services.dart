import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/reset_password_model.dart';

abstract class ResetPasswordServices {
  Future<ResetPasswordModel> postResetPassword(email);
}

class ResetPasswordServicesImpl extends ResetPasswordServices {
  @override
  Future<ResetPasswordModel> postResetPassword(email) async {
    String url = "https://auth.zil.com/api/verify/resetpassword/send-code";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
      },
      headers: {"application-id": "delivery.e_commerce"},
    );
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      return ResetPasswordModel.fromJson(data);
    } else {
      debugPrint("Error in API Call ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
