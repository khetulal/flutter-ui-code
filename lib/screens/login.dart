import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/bloc/login/login_event.dart';
import 'package:sbasics/screens/login_response.dart';
import '../bloc/login/Login_Bloc.dart';
import '../bloc/login/login_state.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginErrorState) {
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
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginTextChangedEvent(
                                emailController.text, passwordController.text));
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Password"),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'password',
                      ),
                      controller: passwordController,
                      onChanged: (val) {
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginTextChangedEvent(
                                emailController.text, passwordController.text));
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CupertinoButton(
                        child: Text('login'),
                        color: (state is LoginValidState)
                            ? Colors.blue
                            : Colors.grey,
                        onPressed: () {
                          if (state is LoginValidState) {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginSubmittedEvent(emailController.text,
                                  passwordController.text),
                            );
                          }
                          if (state is LoginloadedData) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<LoginBloc>(context),
                                  child:
                                      ResponseLogin(loginData: state.loginData),
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
