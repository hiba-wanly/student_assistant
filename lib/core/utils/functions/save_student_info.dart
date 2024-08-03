import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';

void saveStudentInfoData(StudentInfoModel studentinfo, String boxName){
  var box = Hive.box<StudentInfoModel>(boxName);
  box.clear();
  box.add(studentinfo);
}
void deleteLoginData( String boxName){
  var box = Hive.box<StudentInfoModel>(boxName);
  box.clear();
  debugPrint(box.toString());
}