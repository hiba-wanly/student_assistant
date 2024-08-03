import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_register/featuers/home/data/model/student.dart';

void saveLoginData(Student login, String boxName){
  var box = Hive.box<Student>(boxName);
  box.clear();
  debugPrint("saveLoginData");
  box.add(login);
}
void deleteLoginData( String boxName){
  var box = Hive.box<Student>(boxName);
  box.clear();
  debugPrint(box.toString());
}