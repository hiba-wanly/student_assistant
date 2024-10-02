import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callMySubject([Param param]);
  Future<Either<Failure, Type>> callDeleteMySubject(int sub_id,[Param param]);
}

class NoParam {}
