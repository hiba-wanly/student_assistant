import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/add_subject/data/model/subject_student.dart';
import 'package:student_register/featuers/add_subject/domain/repos/ss_repo.dart';
import 'package:student_register/featuers/add_subject/domain/use_case/ss_use_case.dart';

class FetchStudentSubjectUseCase extends UseCase<SubjectStudent,NoParam> {
  final SSRepo repo;
  FetchStudentSubjectUseCase(this.repo);

  @override
  Future<Either<Failure, SubjectStudent>> callAdd(Map<String,dynamic> data1,[NoParam? param]) async{
    return await repo.addSubject(data1);
  }

  @override
  Future<Either<Failure, SubjectStudent>> callGet(Map<String,dynamic> dataa,[NoParam? param]) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SubjectStudent>> call([NoParam? param]) async {
    throw UnimplementedError();
  }
}


class FetchSubjectUseCase extends UseCase<List<Subject>,NoParam> {
  final SSRepo repo;
  FetchSubjectUseCase(this.repo);

  @override
  Future<Either<Failure, List<Subject>>> callAdd(Map<String,dynamic> data1,[NoParam? param]) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Subject>>> callGet(Map<String,dynamic> dataa,[NoParam? param]) async{
    return await repo.getAllSubject(dataa);
  }

  @override
  Future<Either<Failure, List<Subject>>> call([NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}