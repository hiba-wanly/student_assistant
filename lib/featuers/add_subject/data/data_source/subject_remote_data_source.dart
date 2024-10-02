
import 'package:flutter/material.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/add_subject/data/model/subject_student.dart';

abstract class SubjectRemoteDataSource{
  Future<SubjectStudent> addSubject(Map<String,dynamic> data1);
  Future<List<Subject>> getAllSubject(Map<String,dynamic> dataa);
}

class SubjectRemoteDataSourceImpl extends SubjectRemoteDataSource{
  final ApiService apiService;
  SubjectRemoteDataSourceImpl(this.apiService);

  @override
  Future<SubjectStudent> addSubject(Map<String,dynamic> data1) async{
    print("SSSSSS");
    var data = await apiService.post(endPoint: 'student/addsubjectstudent',data1: data1);
    SubjectStudent s = getStudentList(data);
    return s;
  }

  @override
  Future<List<Subject>> getAllSubject(Map<String,dynamic> dataa) async{
    debugPrint("5");
    var data = await apiService.getSubject(endPoint: 'subject/student/', data1: dataa);
    debugPrint("5herer");

    List<Subject> s = getSubjectList(data);
    debugPrint("6herer");
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


  SubjectStudent getStudentList(Map<String,dynamic> data){
    SubjectStudent s = SubjectStudent.fromJson(data);
    return s;
  }

}