import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/mysubject/data/model/subject_student.dart';

abstract class SSRepo{
  Future<Either<ServerFailure,SubjectStudent>> addSubject(Map<String,dynamic> data1);
  Future<Either<ServerFailure,List<Subject>>> getAllSubject(Map<String,dynamic> dataa);
}