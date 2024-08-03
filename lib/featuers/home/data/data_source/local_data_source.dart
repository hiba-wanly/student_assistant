import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';

abstract class LoginLocalDataSource {
  Student fetchLogin();
  StudentInfoModel fetchStudentInfo();
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource
{

  @override
  Student fetchLogin() {
    debugPrint("here fetchLogin");
    var box = Hive.box<Student>(kLoginBox);
    debugPrint(box.values.first as String?);
    // box.clear();
    return box.values.first;
  }

  @override
  StudentInfoModel fetchStudentInfo() {
    var box = Hive.box<StudentInfoModel>(kStudentInfoBox);
    // box.clear();
    return box.values.first;
  }

}