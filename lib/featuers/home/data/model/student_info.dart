import 'package:hive/hive.dart';
part  'student_info.g.dart';

@HiveType(typeId: 1)
class StudentInfoModel {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic student;
  @HiveField(2)
  dynamic academic_year;
  @HiveField(3)
  dynamic exam_number;

  StudentInfoModel(
      {
        required  this.student,
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