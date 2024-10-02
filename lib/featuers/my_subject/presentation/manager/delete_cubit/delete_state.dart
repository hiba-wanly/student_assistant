import 'package:flutter/material.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';

@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteFailure extends DeleteState {
  final String errMessage;
  DeleteFailure(this.errMessage);
}

class DeleteSuccess extends DeleteState {
  final List<Subject> subject;
  DeleteSuccess(this.subject);
}

