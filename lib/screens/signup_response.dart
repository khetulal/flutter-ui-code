import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/Models/Register_model.dart';

import '../bloc/register/register_bloc.dart';
import '../bloc/register/register_state.dart';

// ignore: must_be_immutable
class ResponseSignup extends StatelessWidget {
  RegisterModel registerData;
  ResponseSignup({Key key, this.registerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Response Data'),
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoadedDataState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Id : ${registerData.id.toString()}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Email : ${registerData.email}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Phone: ${registerData.phoneNumber}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'FirstName : ${registerData.firstName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'LastName : ${registerData.lastName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Refresh Token : ${registerData.token.refresh}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Access Token : ${registerData.token.access}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
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
