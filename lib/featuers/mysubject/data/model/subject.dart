import 'package:flutter/material.dart';

class Subject {
  int? id;
  String? subjectName;
  String? academicYear;
  String? section;
  String? semester;
  String? year;
  dynamic studyMark;
  dynamic attendanceMark;
  dynamic workMark;
  dynamic laboratoryMark;
  dynamic totalMark;
  dynamic numberOfPraccticalSessions;
  dynamic numberOfTheoreticalSessions;
  dynamic studyMarkFrom;
  dynamic workMarkFrom;

  Subject(
      {
       required this.id,
        required  this.subjectName,
        required  this.academicYear,
        required  this.section,
        required  this.semester,
        required  this.year,
        this.studyMark,
        this.attendanceMark,
        this.workMark,
        this.laboratoryMark,
        this.totalMark,
        this.numberOfPraccticalSessions,
        this.numberOfTheoreticalSessions,
        this.studyMarkFrom,
        this.workMarkFrom});

  Subject.fromJson(Map<String, dynamic> json) {
    debugPrint("DFDFDF");
    id = json['id'];
    debugPrint("1");
    subjectName = json['subject_name'];
    debugPrint("2");
    academicYear = json['academic_year'];
    debugPrint("3");
    section = json['section'];
    debugPrint("4");
    semester = json['semester'];
    debugPrint("5");
    year = json['year'];
    debugPrint("6");
    studyMark = json['study_mark'];
    debugPrint("7");
    attendanceMark = json['attendance_mark'];
    debugPrint("8");
    workMark = json['work_mark'];
    debugPrint("9");
    laboratoryMark = json['laboratory_mark'];
    debugPrint("10");
    totalMark = json['total_mark'];
    debugPrint("11");
    numberOfPraccticalSessions = json['number_of_pracctical_sessions'];
    debugPrint("12");
    numberOfTheoreticalSessions = json['number_of_theoretical_sessions'];
    debugPrint("13");
    studyMarkFrom = json['study_mark_from'];
    debugPrint("14");
    workMarkFrom = json['work_mark_from'];
    debugPrint("15");
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['subject_name'] = this.subjectName;
  //   data['academic_year'] = this.academicYear;
  //   data['section'] = this.section;
  //   data['semester'] = this.semester;
  //   data['year'] = this.year;
  //   data['study_mark'] = this.studyMark;
  //   data['attendance_mark'] = this.attendanceMark;
  //   data['work_mark'] = this.workMark;
  //   data['laboratory_mark'] = this.laboratoryMark;
  //   data['total_mark'] = this.totalMark;
  //   data['number_of_pracctical_sessions'] = this.numberOfPraccticalSessions;
  //   data['number_of_theoretical_sessions'] = this.numberOfTheoreticalSessions;
  //   data['study_mark_from'] = this.studyMarkFrom;
  //   data['work_mark_from'] = this.workMarkFrom;
  //   return data;
  // }
}