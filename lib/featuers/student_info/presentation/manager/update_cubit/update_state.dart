import 'package:flutter/material.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';

@immutable
abstract class UpdateStudentInfoListState{}

class UpdateStudentInfoListInitial extends UpdateStudentInfoListState{}

class UpdateStudentInfoListLoading extends UpdateStudentInfoListState{}

class UpdateStudentInfoListFailure extends UpdateStudentInfoListState{
  final String errMessage;
  UpdateStudentInfoListFailure(this.errMessage);
}

class UpdateStudentInfoListSuccess extends UpdateStudentInfoListState{
  final StudentInfoModel studentinfo;
  UpdateStudentInfoListSuccess(this.studentinfo);
}

