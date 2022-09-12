import 'package:sbasics/Models/login_model.dart';
// ignore: unused_import
import 'package:sbasics/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveToken(Login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('status', Login.status);
    prefs.setString('user', Login.user);
    prefs.setString('userrole', Login.userRole);
    prefs.setString('token', Login.token);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<Login> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int status = prefs.getInt("status");
    final user = prefs.getString("user");
    final userRole = prefs.getString("userRole");
    Token token = prefs.getString("token") as Token;

    return login(status: status, user: user, userRole: userRole, Token: token);
  }

  void removetoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('status');
    prefs.remove('user');
    prefs.remove('userRole');
    prefs.remove('token');
  }

  Future<String> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

  // ignore: missing_return
  Future<Login> login({
    final user,
    final userRole,
    Token Token,
    int status,
  }) {}
}
