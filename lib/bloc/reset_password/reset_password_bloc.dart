import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbasics/bloc/reset_password/reset_password_event.dart';
import 'package:sbasics/bloc/reset_password/reset_password_state.dart';
import '../../Models/reset_password_model.dart';
import '../../services/reset_password_services.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordServices resetPasswordrepository;
  ResetPasswordBloc(this.resetPasswordrepository)
      : super(ResetPasswordInitialState()) {
    on<ResetPasswordTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(ResetPasswordErrorState("Please enter a valid email address"));
      } else {
        emit(ResetPasswordValidState());
      }
    });

    on<ResetPasswordSubmittedEvent>((event, emit) async {
      emit(ResetPasswordLoadingState());
      try {
        ResetPasswordModel resetPasswordData =
            await ResetPasswordServicesImpl().postResetPassword(event.email);
        emit(ResetPasswordloadedData(resetPasswordData));
      } catch (e) {
        emit(ResetPasswordErrorState(e.toString()));
      }
    });
  }
}
