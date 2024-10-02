import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';

abstract class UseCase<Type , Param>{

  Future<Either<Failure,Type>> callupdateStudentInfo(Map<String, dynamic> data1,[Param param]);
  Future<Either<Failure,Type>> callGetStudentInfo([Param param]);
}
class NoParam{}