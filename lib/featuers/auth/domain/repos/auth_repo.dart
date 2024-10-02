import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, AuthModel>> fetchLoginData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, AuthModel>> logoutUser();
  Future<Either<ServerFailure, AuthModel>> fetchSignupData(
      Map<String, dynamic> data2);
}
