import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_register/constant.dart';


class ApiLog {
  final baseUrl = serverApi;
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: serverApi,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    ),
  );

  userId(String id) async {
    (await SharedPreferences.getInstance()).setString("id", id);
  }

  Future getUserId() async {
    return (await SharedPreferences.getInstance()).get("id");
  }

  Future getUser() async {
    return await getUserId();
  }

  void idy() async {
    int idnum = await getUserId();
    print(idnum);
  }


  Future getToken() async {
    return (await SharedPreferences.getInstance()).get("token");
  }


  storeToken(String access_token) async {
    (await SharedPreferences.getInstance()).setString(
        "token", access_token);
  }


  storeUserId(String id) async {
    (await SharedPreferences.getInstance()).setString(
        "user_id", id);
  }
  storeStudentId(String id) async {
    (await SharedPreferences.getInstance()).setString(
        "student_id", id);
  }

  storeuserName(String userName) async {
    (await SharedPreferences.getInstance()).setString(
        "userName", userName);
  }

  storeemail(String email) async {
    (await SharedPreferences.getInstance()).setString(
        "email", email);
  }


  storeFirstName(String telegramId) async {
    (await SharedPreferences.getInstance()).setString(
        "first_name", telegramId);
  }

  storeLastName(String telegramId) async {
    (await SharedPreferences.getInstance()).setString(
        "last_name", telegramId);
  }
  storeFatherName(String telegramId) async {
    (await SharedPreferences.getInstance()).setString(
        "father_name", telegramId);
  }
  storeDepartment(String telegramId) async {
    (await SharedPreferences.getInstance()).setString(
        "department_id", telegramId);
  }



  Future<Map<String, dynamic>> postLR({required String endPoint, required Map<String,dynamic> data1}) async {
    FormData data2 = FormData.fromMap(data1);
    debugPrint("M##11");
    debugPrint(data1.toString());
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    if(response.statusCode == 200){
      storeToken(response.data['token']);
      storeUserId(response.data['user']['user_id'].toString());
      storeStudentId(response.data['user']['student_id'].toString());
      storeuserName(response.data['user']['username']);
      storeemail(response.data['user']['email']);
      storeFirstName(response.data['user']['first_name']);
      storeLastName(response.data['user']['last_name']);
      storeFatherName(response.data['user']['father_name']);
      storeDepartment(response.data['user']['department_id'].toString());
    }
    return response.data;
  }


  Future<Map<String, dynamic>> postLogout({required String endPoint}) async {

    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.post(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );

    if(response.statusCode == 200){

    }
    return response.data;
  }



}