import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/Models/reset_password_model.dart';
import '../Models/reset_password_model.dart';
import '../bloc/reset_password/reset_password_bloc.dart';
import '../bloc/reset_password/reset_password_state.dart';

// ignore: must_be_immutable
class ResponseResetPassword extends StatelessWidget {
  ResetPasswordModel resetPasswordData;
  ResponseResetPassword(
      {Key key, this.resetPasswordData, ResetPasswordloadedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('reset password Response Data'),
      ),
      body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          if (state is ResetPasswordState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'success: ${resetPasswordData.success}',
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
