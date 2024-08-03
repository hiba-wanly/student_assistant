import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/data_source/local_data_source.dart';
import 'package:student_register/featuers/home/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/home/domain/repos/repo.dart';

class RepoImpl extends Repo {
  final RemoteDataSource remoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;
  RepoImpl({required this.remoteDataSource, required this.loginLocalDataSource});


  Future<Either<ServerFailure, Student>> fetchLogin() async {
    try {
      print("here");
      Student nums;
      nums= loginLocalDataSource.fetchLogin();
      if (nums == null)
        print("GHGHGH");
      debugPrint(nums.toString());
      return right(nums);
      return left(ServerFailure(nums.toString()));
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Student>> addStudent(Map<String,dynamic> data1)async {
   try {
     print("KKKKKKKKK11");
     Student ss;
     print("KKKKKKKKK22");
     ss= await remoteDataSource.addStudent(data1);
     return right(ss);
   }   catch (e) {
     if(e is DioError){
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<ServerFailure,List<Subject>>> getAllSubject() async{
    try {
      print("KKKKKKKKK");
      List<Subject> s;
      s= await remoteDataSource.getAllSubject();
      return right(s);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure,StudentInfoModel>> updateStudentInfo(Map<String,dynamic> data1, int id_student)async {
    try {
      print("KKKKKKKKK11");
      StudentInfoModel ss;
      print("KKKKKKKKK22");
      ss= await remoteDataSource.updateStudentInfo(data1,  id_student);
      return right(ss);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure,StudentInfoModel>> getStudentInfoList( int id_student)async{
    try {
      print("KKKKKKKKK");
      StudentInfoModel s;
      s = loginLocalDataSource.fetchStudentInfo();
      if (s != null){
        return right(s);
      }
      s= await remoteDataSource.getStudentInfoList( id_student);
      return right(s);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}