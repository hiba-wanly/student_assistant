import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/my_subject/data/data_source/home_remote_data_source.dart';
import 'package:student_register/featuers/my_subject/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Subject>>> fetchMySubjectData() async {
    try {
      debugPrint("KKKHEREERER");
      List<Subject> nums;
      nums = await homeRemoteDataSource.fetchMySubjectData();
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

  @override
  Future<Either<ServerFailure, List<Subject>>> fetchDeleteMySubject(int sub_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Subject> nums;
      nums = await homeRemoteDataSource.fetchDeleteMySubject(sub_id);
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


}
