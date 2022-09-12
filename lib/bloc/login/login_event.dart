// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  LoginTextChangedEvent(this.emailValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
