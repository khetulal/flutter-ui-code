import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/screens/reset_password_response.dart';
import '../bloc/reset_password/reset_password_bloc.dart';
import '../bloc/reset_password/reset_password_event.dart';
import '../bloc/reset_password/reset_password_state.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('ResetPasword'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      builder: (context, state) {
                        if (state is ResetPasswordErrorState) {
                          return Text(
                            state.errorMessage,
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Email"),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'email',
                      ),
                      controller: emailController,
                      onChanged: (val) {
                        BlocProvider.of<ResetPasswordBloc>(context)
                            .add(ResetPasswordTextChangedEvent(
                          emailController.text,
                        ));
                      },
                    ),
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                        builder: (context, state) {
                      if (state is ResetPasswordLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CupertinoButton(
                        child: Text('Reset Password'),
                        color: (state is ResetPasswordValidState)
                            ? Colors.blue
                            : Colors.grey,
                        onPressed: () {
                          if (state is ResetPasswordValidState) {
                            BlocProvider.of<ResetPasswordBloc>(context).add(
                              ResetPasswordSubmittedEvent(emailController.text),
                            );
                          }
                          if (state is ResetPasswordloadedData) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ResetPasswordBloc>(
                                      context),
                                  child: ResponseResetPassword(
                                      ResetPasswordloadedData:
                                          state.resetPasswordData),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
