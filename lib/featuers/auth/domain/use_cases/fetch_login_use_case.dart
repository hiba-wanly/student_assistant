import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/auth/data/models/auth_model.dart';
import 'package:student_register/featuers/auth/domain/repos/auth_repo.dart';
import 'use_case.dart';

class FetchAuthUseCase extends UseCase<AuthModel, NoParam> {
  final AuthRepo authRepo;
  FetchAuthUseCase(this.authRepo);

  @override
  Future<Either<Failure, AuthModel>> callLogout( [NoParam? param]) async {
    return await authRepo.logoutUser();
  }

  @override
  Future<Either<Failure, AuthModel>> callLogin(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await authRepo.fetchLoginData(data2);
  }

  @override
  Future<Either<Failure, AuthModel>> callSignUp(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await authRepo.fetchSignupData(data2);
  }
}
