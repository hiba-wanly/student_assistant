import 'package:flutter/material.dart';

class Subject {
  dynamic id;
  dynamic subjectName;
  dynamic academicYear;
  dynamic departments;
  dynamic semester;
  dynamic year;

  dynamic tests_mark;
  dynamic attendance_mark;
  dynamic interviews_mark;
  dynamic homework_mark;
  dynamic labs_mark;
  dynamic total_mark;
  dynamic practical_mark;

  Subject(
      {
       required this.id,
        required  this.subjectName,
        required  this.academicYear,
        required  this.departments,
        required  this.semester,
        required  this.year,
        this.tests_mark,
        this.attendance_mark,
        this.interviews_mark,
        this.homework_mark,
        this.labs_mark,
        this.total_mark,
        this.practical_mark,
        });

  Subject.fromJson(Map<String, dynamic> json) {
    debugPrint("DFDFDF");
    id = json['id'];
    debugPrint("1");
    subjectName = json['subject_name'];
    debugPrint("2");
    academicYear = json['academic_year'];
    debugPrint("3");
    departments = json['departments'];
    debugPrint("4");
    semester = json['semester'];
    debugPrint("5");
    year = json['year'];
    debugPrint("6");
    tests_mark = json['tests_mark'];
    debugPrint("7");
    attendance_mark = json['attendance_mark'];
    debugPrint("8");
    interviews_mark = json['interviews_mark'];
    debugPrint("9");
    homework_mark = json['homework_mark'];
    debugPrint("10");
    labs_mark = json['labs_mark'];
    debugPrint("11");
    total_mark = json['total_mark'];
    debugPrint("12");
    practical_mark = json['practical_mark'];
    debugPrint("13");

  }

}