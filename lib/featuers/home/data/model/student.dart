import 'package:hive/hive.dart';
part  'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? fatherName;
  // dynamic examNumber;
  // String? status;
  // String? year;
  @HiveField(4)
  String? section;
  // String? semester;
  // String? academicYear;
  // int? subjectId;

  Student(
      {
      required  this.firstName,
        required  this.lastName,
        required  this.fatherName,
        //   this.examNumber,
        // required  this.status,
        // required  this.year,
        required  this.section,
        // required this.semester,
        // required  this.academicYear,
        // required   this.subjectId
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    // examNumber = json['exam_number'];
    // status = json['status'];
    // year = json['year'];
    section = json['section'];
    // semester = json['semester'];
    // academicYear = json['academic_year'];
    // subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    // data['exam_number'] = this.examNumber;
    // data['status'] = this.status;
    // data['year'] = this.year;
    data['section'] = this.section;
    // data['semester'] = this.semester;
    // data['academic_year'] = this.academicYear;
    // data['subject_id'] = this.subjectId;
    return data;
  }
}