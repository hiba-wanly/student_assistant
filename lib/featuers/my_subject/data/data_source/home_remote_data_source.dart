import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';

abstract class HomeRemoteDataSource {
  Future<List<Subject>> fetchMySubjectData();
  Future<List<Subject>> fetchDeleteMySubject(int sub_id);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Subject>> fetchMySubjectData() async {
    var data = await apiService.get( endPoint: 'student/mysubject');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Subject> nums = getSubject(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  List<Subject> getSubject(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Subject> nums=[];
    for(var numMap in data['data']){
      nums.add(Subject.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<List<Subject>> fetchDeleteMySubject(int sub_id) async {
    var data = await apiService.delete( endPoint: 'student/deletesubjectstudent/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Subject> nums = getSubject(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
}

