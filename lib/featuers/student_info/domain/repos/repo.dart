import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
abstract class StudentInfoRepo{

  Future<Either<ServerFailure,StudentInfoModel>> updateStudentInfo(Map<String,dynamic> data1);
  Future<Either<ServerFailure,StudentInfoModel>> getStudentInfoList();
}