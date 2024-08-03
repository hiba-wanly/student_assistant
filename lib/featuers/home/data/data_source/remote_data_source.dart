
import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/core/utils/functions/save_login.dart';
import 'package:student_register/core/utils/functions/save_student_info.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';

abstract class RemoteDataSource{
  Future<Student> addStudent(Map<String,dynamic> data1);
  Future<List<Subject>> getAllSubject();

  Future<StudentInfoModel> updateStudentInfo(Map<String,dynamic> data1, int id_student);
  Future<StudentInfoModel> getStudentInfoList( int id_student);

}

class RemoteDataSourceImpl extends RemoteDataSource{
  final ApiService apiService;
  RemoteDataSourceImpl(this.apiService);

  @override
  Future<StudentInfoModel> updateStudentInfo(Map<String,dynamic> data1, int id_student) async {
    print("SSSSSS");
    print(id_student);
    var data = await apiService.update(endPoint: 'student/studentinfo/${id_student}',data: data1);
    StudentInfoModel s = getStudentInfo(data);
    saveStudentInfoData(s, kStudentInfoBox);
    return s;
  }

  @override
  Future<StudentInfoModel> getStudentInfoList(int id_student) async {
    debugPrint("5");
    var data = await apiService.get(endPoint: 'student/studentinfo/${id_student}');
    StudentInfoModel s = getStudentInfo(data);
    debugPrint(s.toString());
    saveStudentInfoData(s, kStudentInfoBox);
    return s;
  }

  @override
  Future<Student> addStudent(Map<String,dynamic> data1) async{
    print("SSSSSS");
    var data = await apiService.post(endPoint: 'student/',data1: data1);
    Student s = getStudentList(data);
    saveLoginData(s, kLoginBox);
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


  StudentInfoModel getStudentInfo(Map<String,dynamic> data){
    StudentInfoModel s = StudentInfoModel.fromJson(data['data']);
    return s;
  }

}