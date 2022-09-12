abstract class ResetPasswordEvent {}

class ResetPasswordTextChangedEvent extends ResetPasswordEvent {
  final String emailValue;

  ResetPasswordTextChangedEvent(this.emailValue);
}

class ResetPasswordSubmittedEvent extends ResetPasswordEvent {
  final String email;
  ResetPasswordSubmittedEvent(this.email);
}
