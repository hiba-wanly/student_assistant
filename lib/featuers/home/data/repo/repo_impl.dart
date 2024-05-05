import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/data_source/remote_data_source.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/subject.dart';
import 'package:student_register/featuers/home/domain/repos/repo.dart';

class RepoImpl extends Repo {
  final RemoteDataSource remoteDataSource;

  RepoImpl({required this.remoteDataSource});

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

}