import 'dart:io';

import 'package:flutter/material.dart';

class AuthModel {
  dynamic id;
  dynamic student_id;
  dynamic email;
  dynamic username;
  dynamic password;
  dynamic first_name;
  dynamic last_name;
  dynamic father_name;
  dynamic department_id;


  AuthModel({
    this.id,
     this.student_id,
     this.email,
    this.username,
    this.password,
    this.first_name,
    this.last_name,
    this.father_name,
    this.department_id,
  });



  AuthModel.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['user_id'];
    student_id = json['student_id'];
    username = json['username'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    father_name = json['father_name'];
    department_id = json['department_id'];
  }
}
