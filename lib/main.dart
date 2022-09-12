import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/bloc/register/register_bloc.dart';
import 'package:sbasics/screens/Dashboard.dart';
import 'package:sbasics/screens/register.dart';
import 'package:sbasics/services/login_services.dart';
import 'package:sbasics/services/register_services.dart';
import 'package:sbasics/services/reset_password_services.dart';
import 'package:sbasics/utility/shared_preference.dart';

import 'bloc/login/Login_Bloc.dart';
import 'bloc/reset_password/reset_password_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Future<Register> getUserData() => UserPreferences().getToken();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(LoginServicesImpl()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(rserivce: RegisterServicesImpl()),
        ),
        BlocProvider(
          create: (context) => ResetPasswordBloc(ResetPasswordServicesImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
  }
}
