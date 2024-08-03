import 'package:flutter/material.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';

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

class StudentInfoListLoading extends ListState{}

class StudentInfoListFailure extends ListState{
  final String errMessage;
  StudentInfoListFailure(this.errMessage);
}

class StudentInfoListSuccess extends ListState{
  final StudentInfoModel studentinfo;
  StudentInfoListSuccess(this.studentinfo);
}

