import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/utils/api_service.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';

abstract class AttendanceRemoteDataSource {
  Future<List<Attendance>> fetchGetAttendance(int sub_id);
}

class AttendanceRemoteDataSourceImpl extends AttendanceRemoteDataSource {
  final ApiService apiService;
  AttendanceRemoteDataSourceImpl(this.apiService);


  @override
  Future<List<Attendance>> fetchGetAttendance( int sub_id) async {
    var data = await apiService.get( endPoint: 'attendance/logtostudent/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Attendance> nums = getAttendance(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  List<Attendance> getAttendance(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Attendance> nums=[];
    for(var numMap in data['data']){
      nums.add(Attendance.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

