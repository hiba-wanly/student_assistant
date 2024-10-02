
import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';

abstract class StudentInfoRemoteDataSource{

  Future<StudentInfoModel> updateStudentInfo(Map<String,dynamic> data1);
  Future<StudentInfoModel> getStudentInfoList();

}

class RemoteDataSourceImpl extends StudentInfoRemoteDataSource{
  final ApiService apiService;
  RemoteDataSourceImpl(this.apiService);

  @override
  Future<StudentInfoModel> updateStudentInfo(Map<String,dynamic> data1) async {
    print("SSSSSS");
    var data = await apiService.post(endPoint: 'student/studentinfo/',data1: data1);
    StudentInfoModel s = getStudentInfo(data);
    return s;
  }

  @override
  Future<StudentInfoModel> getStudentInfoList() async {
    debugPrint("5");
    var data = await apiService.get(endPoint: 'student/studentinfo/');
    StudentInfoModel s = getStudentInfo(data);
    debugPrint(s.toString());
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

  StudentInfoModel getStudentInfo(Map<String,dynamic> data){
    StudentInfoModel s = StudentInfoModel.fromJson(data['data']);
    return s;
  }

}