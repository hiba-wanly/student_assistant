import 'package:flutter/material.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/subject.dart';

@immutable
abstract class ListState{}

class ListInitial extends ListState{}

class StudentListLoading extends ListState{}

class StudentListFailure extends ListState{
  final String errMessage;
  StudentListFailure(this.errMessage);
}

class StudentListSuccess extends ListState{
  final Student student;
  StudentListSuccess(this.student);
}

class SubjectListLoading extends ListState{}

class SubjectListFailure extends ListState{
  final String errMessage;
  SubjectListFailure(this.errMessage);
}

class SubjectListSuccess extends ListState{
  final List<Subject> subject;
  SubjectListSuccess(this.subject);
}
