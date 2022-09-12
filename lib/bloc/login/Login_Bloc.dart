import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/services/login_services.dart';
import '../../Models/login_model.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginServices loginrepository;
  LoginBloc(this.loginrepository) : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(LoginErrorState("Please enter a valid password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        LoginModel loginData =
            await LoginServicesImpl().postLogin(event.email, event.password);
        emit(LoginloadedData(loginData));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
