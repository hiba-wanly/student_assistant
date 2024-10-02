import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/student_info/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
import 'package:student_register/featuers/student_info/domain/repos/repo.dart';

class StudentInfoRepoImpl extends StudentInfoRepo {
  final StudentInfoRemoteDataSource remoteDataSource;
  StudentInfoRepoImpl({required this.remoteDataSource});



  @override
  Future<Either<ServerFailure,StudentInfoModel>> updateStudentInfo(Map<String,dynamic> data1)async {
    try {
      print("KKKKKKKKK11");
      StudentInfoModel ss;
      print("KKKKKKKKK22");
      ss= await remoteDataSource.updateStudentInfo(data1);
      return right(ss);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure,StudentInfoModel>> getStudentInfoList()async{
    try {
      print("KKKKKKKKK");
      StudentInfoModel s;
      s= await remoteDataSource.getStudentInfoList();
      return right(s);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}