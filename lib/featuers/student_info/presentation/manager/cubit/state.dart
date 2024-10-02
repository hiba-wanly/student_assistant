import 'package:flutter/material.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';

@immutable
abstract class StudentInfoListState{}

class StudentInfoListInitial extends StudentInfoListState{}

class StudentInfoListLoading extends StudentInfoListState{}

class StudentInfoListFailure extends StudentInfoListState{
  final String errMessage;
  StudentInfoListFailure(this.errMessage);
}


class StudentInfoListSuccess extends StudentInfoListState{
  final StudentInfoModel studentinfo;
  StudentInfoListSuccess(this.studentinfo);
}

