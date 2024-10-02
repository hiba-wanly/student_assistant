import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/my_subject/domain/repos/home_repo.dart';
import 'use_case.dart';

class FetchHomeUseCase extends UseCase<List<Subject>, NoParam> {
  final HomeRepo homeRepo;
  FetchHomeUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<Subject>>> callMySubject( [NoParam? param]) async {
    return await homeRepo.fetchMySubjectData();
  }

  @override
  Future<Either<Failure, List<Subject>>> callDeleteMySubject(int sub_id, [NoParam? param]) async{
    return await homeRepo.fetchDeleteMySubject(sub_id);
  }

}

