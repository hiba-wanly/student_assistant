import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<Subject>>> fetchMySubjectData();
  Future<Either<ServerFailure, List<Subject>>> fetchDeleteMySubject(int sub_id);
}
