import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
import 'package:student_register/featuers/student_info/domain/repos/repo.dart';

import '../../../student_info/domain/use_cases/use_case.dart';



class FetchStudentInfoUseCase extends UseCase<StudentInfoModel,NoParam> {
  final StudentInfoRepo repo;

  FetchStudentInfoUseCase(this.repo);

  @override
  Future<Either<Failure, StudentInfoModel>> callGetStudentInfo( [NoParam? param]) async{
    return await repo.getStudentInfoList();
  }

  @override
  Future<Either<Failure, StudentInfoModel>> callupdateStudentInfo(Map<String, dynamic> data1, [NoParam? param]) async{
    return await repo.updateStudentInfo(data1);
  }


}
