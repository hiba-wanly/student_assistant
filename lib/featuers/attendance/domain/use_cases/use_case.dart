import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callGetAttendance(int sub_id, [Param param]);
}

class NoParam {}
