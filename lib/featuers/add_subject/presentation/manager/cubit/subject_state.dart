
import 'package:flutter/material.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/add_subject/data/model/subject_student.dart';

@immutable
abstract class ListSubjectState{}

class SubjectListInitial extends ListSubjectState{}

class SubjectListLoading extends ListSubjectState{}

class SubjectListFailure extends ListSubjectState{
  final String errMessage;
  SubjectListFailure(this.errMessage);
}


class SubjectListSuccess extends ListSubjectState{
  final List<Subject> subject;
  SubjectListSuccess(this.subject);
}

class SubjectSListLoading extends ListSubjectState{}

class SubjectSListFailure extends ListSubjectState{
  final String errMessage;
  SubjectSListFailure(this.errMessage);
}

class SubjectSListSuccess extends ListSubjectState{
  final SubjectStudent ssubject;
  SubjectSListSuccess(this.ssubject);
}
