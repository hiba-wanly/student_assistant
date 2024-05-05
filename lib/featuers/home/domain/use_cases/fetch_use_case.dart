import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/subject.dart';
import 'package:student_register/featuers/home/domain/repos/repo.dart';
import 'package:student_register/featuers/home/domain/use_cases/use_case.dart';

class FetchStudentUseCase extends UseCase<Student,NoParam> {
  final Repo repo;
  FetchStudentUseCase(this.repo);

  @override
  Future<Either<Failure, Student>> callAdd(Map<String,dynamic> data1,[NoParam? param]) async{
    return await repo.addStudent(data1);
  }

  @override
  Future<Either<Failure, Student>> callGet([NoParam? param]) async{
    throw UnimplementedError();
  }
}


class FetchSubjectUseCase extends UseCase<List<Subject>,NoParam> {
  final Repo repo;
  FetchSubjectUseCase(this.repo);

  @override
  Future<Either<Failure, List<Subject>>> callAdd(Map<String,dynamic> data1,[NoParam? param]) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Subject>>> callGet([NoParam? param]) async{
    return await repo.getAllSubject();
  }
}