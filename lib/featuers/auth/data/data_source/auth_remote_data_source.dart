import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/core/utils/auth_api.dart';
import 'package:student_register/featuers/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> fetchLoginData(Map<String, dynamic> data2);
  Future<AuthModel> fetchSignupData(Map<String, dynamic> data2);
  Future logoutUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl(this.apiService);

  ApiLog apiLog = ApiLog();

  @override
  Future<AuthModel> fetchLoginData(Map<String, dynamic> data2) async {
    var data = await apiLog.postLR(data1: data2, endPoint: 'student/login');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    AuthModel nums = getAuthModel(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser() async {
    var data = await apiLog.postLogout(endPoint: 'student/logout');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    AuthModel nums = getAuthModel(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  @override
  Future<AuthModel> fetchSignupData(Map<String, dynamic> data2) async {
    var data = await apiLog.postLR(data1: data2, endPoint: 'student/register');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    AuthModel nums = getAuthModel(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }


  AuthModel getAuthModel(Map<String, dynamic> data) {
    debugPrint("123456789");
    AuthModel nums = AuthModel.fromJson(data['user']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}

