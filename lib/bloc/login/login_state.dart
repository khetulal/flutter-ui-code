import 'package:sbasics/Models/login_model.dart';

abstract class LoginState {
  get resetPasswordData => null;
}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginloadedData extends LoginState {
  LoginModel loginData;
  LoginloadedData(this.loginData);
}
