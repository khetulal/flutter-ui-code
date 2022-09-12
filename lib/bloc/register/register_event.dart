import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent {}

class RegisterTextChangedEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  RegisterTextChangedEvent(this.firstName, this.lastName, this.email,
      this.phoneNumber, this.password, this.confirmPassword);
}

class RegisterSubmittedEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  RegisterSubmittedEvent(this.firstName, this.lastName, this.email,
      this.phoneNumber, this.password, this.confirmPassword);
}
