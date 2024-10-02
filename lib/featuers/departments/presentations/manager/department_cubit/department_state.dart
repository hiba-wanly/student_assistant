import 'package:flutter/material.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';

@immutable
abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoading extends DepartmentState {}

class DepartmentFailure extends DepartmentState {
  final String errMessage;
  DepartmentFailure(this.errMessage);
}


class DepartmentSuccess extends DepartmentState {
  final List<Departments> departments;
  DepartmentSuccess(this.departments);
}

