import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
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

  @override
  Future<Either<Failure, Student>> call([NoParam? param]) async {
    return await repo.fetchLogin();
  }

  @override
  Future<Either<Failure, Student>> callGetStudentInfo(int id_student, [NoParam? param]) {
    // TODO: implement callGetStudentInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Student>> callupdateStudentInfo(Map<String, dynamic> data1, int id_student, [NoParam? param]) {
    // TODO: implement callupdateStudentInfo
    throw UnimplementedError();
  }
}

class FetchStudentInfoUseCase extends UseCase<StudentInfoModel,NoParam> {
  final Repo repo;

  FetchStudentInfoUseCase(this.repo);

  @override
  Future<Either<Failure, StudentInfoModel>> call([NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StudentInfoModel>> callAdd(Map<String, dynamic> data1, [NoParam? param]) {
    // TODO: implement callAdd
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StudentInfoModel>> callGet([NoParam? param]) {
    // TODO: implement callGet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StudentInfoModel>> callGetStudentInfo(int id_student, [NoParam? param]) async{
    return await repo.getStudentInfoList(id_student);
  }

  @override
  Future<Either<Failure, StudentInfoModel>> callupdateStudentInfo(Map<String, dynamic> data1, int id_student, [NoParam? param]) async{
    return await repo.updateStudentInfo(data1,id_student);
  }


}
// class FetchSubjectUseCase extends UseCase<List<Subject>,NoParam> {
//   final Repo repo;
//   FetchSubjectUseCase(this.repo);
//
//   @override
//   Future<Either<Failure, List<Subject>>> callAdd(Map<String,dynamic> data1,[NoParam? param]) async{
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, List<Subject>>> callGet([NoParam? param]) async{
//     return await repo.getAllSubject();
//   }
//
//   @override
//   Future<Either<Failure, List<Subject>>> call([NoParam? param]) {
//     // TODO: implement call
//     throw UnimplementedError();
//   }
// }