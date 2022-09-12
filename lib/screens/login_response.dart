import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/login_model.dart';
import '../bloc/login/Login_Bloc.dart';
import '../bloc/login/login_state.dart';

// ignore: must_be_immutable
class ResponseLogin extends StatelessWidget {
  LoginModel loginData;
  ResponseLogin({Key key, this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Response Data'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginloadedData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue,
                          style: BorderStyle.solid,
                          width: 5.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        loginData.user.toString(),
                        style: const TextStyle(
                            color: Colors.black12,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        loginData.userRole[0],
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        loginData.token.refresh,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w400),
                      ),
                      Text(loginData.token.access,
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            );
          } else {
            throw ('No data is loaded');
          }
        },
      ),
    );
  }
}
