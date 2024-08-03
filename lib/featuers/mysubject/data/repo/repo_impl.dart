import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/data_source/local_data_source.dart';
import 'package:student_register/featuers/home/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/mysubject/data/data_source/subject_remote_data_source.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/home/domain/repos/repo.dart';
import 'package:student_register/featuers/mysubject/data/model/subject_student.dart';
import 'package:student_register/featuers/mysubject/domain/repos/ss_repo.dart';

class SSRepoImpl extends SSRepo {
  final SubjectRemoteDataSource ssremoteDataSource;
  SSRepoImpl({required this.ssremoteDataSource,});



  @override
  Future<Either<ServerFailure, SubjectStudent>> addSubject(Map<String,dynamic> data1)async {
    try {
      print("KKKKKKKKK11");
      SubjectStudent ss;
      print("KKKKKKKKK22");
      ss= await ssremoteDataSource.addSubject(data1);
      return right(ss);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure,List<Subject>>> getAllSubject(Map<String,dynamic> dataa) async{
    try {
      print("KKKKKKKKK");
      List<Subject> s;
      s= await ssremoteDataSource.getAllSubject(dataa);
      return right(s);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}