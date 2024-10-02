import 'package:hive/hive.dart';

class StudentInfoModel {
  dynamic id;
  dynamic student;
  dynamic academic_year;
  dynamic exam_number;

  StudentInfoModel(
      {
          this.student,
        required  this.academic_year,
        required  this.exam_number,
      });

  StudentInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    academic_year = json['academic_year'];
    exam_number = json['exam_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student'] = this.student;
    data['academic_year'] = this.academic_year;
    data['exam_number'] = this.exam_number;
    return data;
  }
}