import 'package:flutter/material.dart';
import 'package:student_register/featuers/auth/data/models/auth_model.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure(this.errMessage);
}


class AuthSuccess extends AuthState {
  final AuthModel auth;
  AuthSuccess(this.auth);
}

