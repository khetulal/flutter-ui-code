import 'package:sbasics/Models/register_model.dart';

import 'package:sbasics/screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/register.dart';

class UserPreferences {
  Future<bool> saveToken(Register) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', Register.id);
    prefs.setString('username', Register.username);
    prefs.setString('email', Register.email);
    prefs.setString('FirstName', Register.firstName);
    prefs.setString('LastName', Register.lastName);
    prefs.setString('phone', Register.phone);
    prefs.setString('token', Register.token);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<Register> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt("id");
    final email = prefs.getString("email");
    final firstName = prefs.getString("firstName");
    final lastName = prefs.getString("lastName");
    final PhoneNumber = prefs.getString("phoneNumber");
    Token token = prefs.getString("token") as Token;

    return register(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      PhoneNumber: PhoneNumber,
      Token: token,
    );
  }

  void removetoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('email');
    prefs.remove('phoneNumber');
    prefs.remove('type');
    prefs.remove('token');
  }

  Future<String> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

  // ignore: missing_return
  Future<Register> register({
    final firstName,
    final lastName,
    final email,
    final PhoneNumber,
    final type,
    int id,
    Token Token,
  }) {}
}
