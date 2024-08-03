import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call([Param param]);
  Future<Either<Failure,Type>> callAdd(Map<String, dynamic> data1,[Param param]);
  Future<Either<Failure,Type>> callGet([Param param]);

  Future<Either<Failure,Type>> callupdateStudentInfo(Map<String, dynamic> data1,int id_student,[Param param]);
  Future<Either<Failure,Type>> callGetStudentInfo(int id_student,[Param param]);
}
class NoParam{}