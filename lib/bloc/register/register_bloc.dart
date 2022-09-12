import 'package:bloc/bloc.dart';
import 'package:sbasics/bloc/register/register_event.dart';
import 'package:sbasics/bloc/register/register_state.dart';

import '../../Models/Register_model.dart';
import '../../services/register_services.dart';
import '../../utility/ui_constrats.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterServices rserivce;
  RegisterBloc({this.rserivce}) : super(RegisterInitialState()) {
    on<RegisterTextChangedEvent>(
      (event, emit) {
        if (!Regexp.firstRegex.hasMatch(event.firstName)) {
          emit(
            RegisterErrorState(
                message: 'Enter the first name in alphabet only'),
          );
        } else if (!Regexp.lastRegex.hasMatch(event.lastName)) {
          emit(
            RegisterErrorState(message: 'Enter the last name in alphabet only'),
          );
        } else if (!Regexp.emailRegex.hasMatch(event.email)) {
          emit(
            RegisterErrorState(message: 'Enter the correct email'),
          );
        } else if (!Regexp.mobileRegex.hasMatch(event.phoneNumber)) {
          emit(
            RegisterErrorState(message: 'Enter the 10 digit mobile number'),
          );
        } else if (!Regexp.passwordRegex.hasMatch(event.password)) {
          emit(
            RegisterErrorState(message: 'Enter the atleast 8 character '),
          );
        } else if (event.password != event.confirmPassword) {
          emit(
            RegisterErrorState(
                message:
                    'The confirm password entered is different from the password'),
          );
        } else {
          emit(RegisterValidState());
        }
      },
    );
    on<RegisterSubmittedEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        RegisterModel registerData = await RegisterServicesImpl().postRegister(
            event.firstName,
            event.lastName,
            event.email,
            event.phoneNumber,
            event.password,
            event.confirmPassword);
        emit(
          RegisterLoadedDataState(registerData: registerData),
        );
      } catch (e) {
        emit(RegisterErrorState(message: e.toString()));
      }
    });
  }
}
