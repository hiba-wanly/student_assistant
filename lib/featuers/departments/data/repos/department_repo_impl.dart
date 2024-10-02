import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/departments/data/data_source/department_remote_data_source.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';
import 'package:student_register/featuers/departments/domain/repos/department_repo.dart';

class DepartmentRepoImpl extends DepartmentRepo {
  final DepartmentRemoteDataSource departmentRemoteDataSource;

  DepartmentRepoImpl({
    required this.departmentRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Departments>>> fetchDepartmentData() async {
    try {
      debugPrint("KKKHEREERER");
      List<Departments> nums;
      nums = await departmentRemoteDataSource.fetchDepartmentData();
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<ServerFailure, List<Lecturer>>> fetchLecturerData() async {
  //   try {
  //     debugPrint("KKKHEREERER");
  //     List<Lecturer> nums;
  //     nums = await departmentRemoteDataSource.fetchLecturerData();
  //     debugPrint("AAAAAAAA");
  //     debugPrint(nums.toString());
  //     return right(nums);
  //   } catch (e) {
  //     if (e is DioError) {
  //       debugPrint("ERORRORORO11111111111");
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     debugPrint("ERORROROR22222222222");
  //     debugPrint(e.toString());
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  //
  // @override
  // Future<Either<ServerFailure, GeneralInformation>> fetchGeneralInformationData() async {
  //   try {
  //     debugPrint("KKKHEREERER");
  //     GeneralInformation nums;
  //     nums = await departmentRemoteDataSource.fetchGeneralInformationData();
  //     debugPrint("AAAAAAAA");
  //     debugPrint(nums.toString());
  //     return right(nums);
  //   } catch (e) {
  //     if (e is DioError) {
  //       debugPrint("ERORRORORO11111111111");
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     debugPrint("ERORROROR22222222222");
  //     debugPrint(e.toString());
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<ServerFailure, List<Student>>> fetchGetStudentSubject(int sub_id) async {
  //   try {
  //     debugPrint("KKKHEREERER");
  //     List<Student> nums;
  //     nums = await departmentRemoteDataSource.fetchGetStudentSubject(sub_id);
  //     debugPrint("AAAAAAAA");
  //     debugPrint(nums.toString());
  //     return right(nums);
  //   } catch (e) {
  //     if (e is DioError) {
  //       debugPrint("ERORRORORO11111111111");
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     debugPrint("ERORROROR22222222222");
  //     debugPrint(e.toString());
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

}
