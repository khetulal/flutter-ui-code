import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/screens/signup_response.dart';
import 'package:sbasics/utility/widgets.dart';
import '../bloc/register/register_bloc.dart';
import '../bloc/register/register_event.dart';
import '../bloc/register/register_state.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text('registeration'),
                  ),
                  body: SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              if (state is RegisterErrorState) {
                                return Text(
                                  state.message,
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
                          Text('Username'),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            autofocus: false,
                            decoration: buildInputDecoration(
                                "Enter Username", Icons.person),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('First name'),
                          TextField(
                              autofocus: false,
                              controller: firstNameController,
                              decoration: buildInputDecoration(
                                  "Enter FirstName", Icons.person),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('LastName'),
                          TextField(
                              controller: lastNameController,
                              decoration: buildInputDecoration(
                                  "Enter LastName ", Icons.person),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Email'),
                          TextField(
                              autofocus: false,
                              controller: emailController,
                              decoration: buildInputDecoration(
                                  "Enter Email", Icons.email),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('phone number'),
                          TextField(
                              autofocus: false,
                              controller: phoneNumberController,
                              decoration: buildInputDecoration(
                                  "Enter Phone number", Icons.phone),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Password'),
                          TextField(
                              autofocus: false,
                              obscureText: true,
                              controller: passwordController,
                              decoration: buildInputDecoration(
                                  "Enter Password", Icons.lock),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Confirm Password'),
                          TextField(
                              autofocus: false,
                              obscureText: true,
                              controller: confirmpasswordController,
                              decoration: buildInputDecoration(
                                  "Enter Confirm Password", Icons.lock),
                              onChanged: (val) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterTextChangedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text));
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                            if (state is RegisterLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return CupertinoButton(
                              child: Text('Register'),
                              color: (state is RegisterValidState)
                                  ? Colors.blue
                                  : Colors.grey,
                              onPressed: () {
                                if (state is RegisterValidState) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterSubmittedEvent(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmpasswordController.text),
                                  );
                                }
                                if (state is RegisterLoadedDataState) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: BlocProvider.of<RegisterBloc>(
                                            context),
                                        child: ResponseSignup(
                                            registerData: state.registerData),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          })
                        ]),
                  )));
            }));
  }
}
