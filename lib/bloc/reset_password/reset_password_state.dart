import '../../Models/reset_password_model.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordValidState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordErrorState(this.errorMessage);
}

class ResetPasswordloadedData extends ResetPasswordState {
  ResetPasswordModel resetPasswordData;
  ResetPasswordloadedData(this.resetPasswordData);
}
