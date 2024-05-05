
import 'package:flutter/material.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/subject.dart';

abstract class RemoteDataSource{
  Future<Student> addStudent(Map<String,dynamic> data1);
  Future<List<Subject>> getAllSubject();
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final ApiService apiService;
  RemoteDataSourceImpl(this.apiService);

  @override
  Future<Student> addStudent(Map<String,dynamic> data1) async{
    print("SSSSSS");
    var data = await apiService.post(endPoint: 'student/',data1: data1);
    Student s = getStudentList(data);
    return s;
  }

  @override
  Future<List<Subject>> getAllSubject() async{
    debugPrint("5");
    var data = await apiService.get(endPoint: 'subject/');
    List<Subject> s = getSubjectList(data);
    debugPrint(s.toString());
    return s;
  }


  List<Subject> getSubjectList(Map<String,dynamic> data){
    List<Subject> s =[];
    for (var ss in data['data']){
     s.add(Subject.fromJson(ss));
    }

    return s;
  }


  Student getStudentList(Map<String,dynamic> data){
    Student s = Student.fromJson(data['data']);
    return s;
  }

}