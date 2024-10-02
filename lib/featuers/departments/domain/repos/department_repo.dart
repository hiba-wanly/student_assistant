import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';

abstract class DepartmentRepo {
  Future<Either<ServerFailure, List<Departments>>> fetchDepartmentData();
  // Future<Either<ServerFailure, List<Lecturer>>> fetchLecturerData();
  // Future<Either<ServerFailure, GeneralInformation>> fetchGeneralInformationData();
  // Future<Either<ServerFailure, List<Student>>> fetchGetStudentSubject( int sub_id);
}
