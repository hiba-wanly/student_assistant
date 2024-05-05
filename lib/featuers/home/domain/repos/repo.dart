import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/subject.dart';

abstract class Repo{
  Future<Either<ServerFailure,Student>> addStudent(Map<String,dynamic> data1);
  Future<Either<ServerFailure,List<Subject>>> getAllSubject();
}