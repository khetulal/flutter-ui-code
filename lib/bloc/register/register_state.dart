import '../../Models/Register_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterValidState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedDataState extends RegisterState {
  RegisterModel registerData;
  RegisterLoadedDataState({this.registerData});
}

class RegisterErrorState extends RegisterState {
  String message;
  RegisterErrorState({this.message});
}
