import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_register/constant.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = serverApi;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    debugPrint("dio");
    // debugPrint("$baseUrl$endPoint");
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    debugPrint("response response");
    debugPrint(response.toString());

    return response.data;
  }
  Future<Map<String, dynamic>> getSubject({required String endPoint,required Map<String,dynamic> data1}) async {
    debugPrint("dio5555");
    // debugPrint(data1.toString());
    // FormData data2 = FormData.fromMap(data1);
    // debugPrint("$baseUrl$endPoint");
    var response = await _dio.get(
      '$baseUrl$endPoint',
      data: data1,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    debugPrint("response response");
    debugPrint(response.toString());

    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint, required Map<String,dynamic> data1}) async {
    FormData data2 = FormData.fromMap(data1);
    debugPrint("kkk");
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    // debugPrint("$baseUrl$endPoint");
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> update({required String endPoint, required Map<String,dynamic> data}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.delete(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    return response.data;
  }

}
