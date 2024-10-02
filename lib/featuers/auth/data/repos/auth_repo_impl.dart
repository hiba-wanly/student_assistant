import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/auth/data/data_source/auth_remote_data_source.dart';
import 'package:student_register/featuers/auth/data/models/auth_model.dart';
import 'package:student_register/featuers/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, AuthModel>> fetchLoginData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      AuthModel nums;
      nums = await authRemoteDataSource.fetchLoginData(data2);
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
  Future<Either<ServerFailure, AuthModel>> logoutUser() async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      AuthModel nums;
      nums = await authRemoteDataSource.logoutUser();
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, AuthModel>> fetchSignupData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      AuthModel nums;
      nums = await authRemoteDataSource.fetchSignupData(data2);
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
