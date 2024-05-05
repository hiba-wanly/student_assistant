class Student {
  String? fullName;
  String? fatherName;
  dynamic examNumber;
  String? status;
  String? year;
  String? section;
  String? semester;
  String? academicYear;
  int? subjectId;

  Student(
      {
      required  this.fullName,
        required  this.fatherName,
          this.examNumber,
        required  this.status,
        required  this.year,
        required  this.section,
        required this.semester,
        required  this.academicYear,
        required   this.subjectId});

  Student.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    fatherName = json['father_name'];
    examNumber = json['exam_number'];
    status = json['status'];
    year = json['year'];
    section = json['section'];
    semester = json['semester'];
    academicYear = json['academic_year'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['father_name'] = this.fatherName;
    data['exam_number'] = this.examNumber;
    data['status'] = this.status;
    data['year'] = this.year;
    data['section'] = this.section;
    data['semester'] = this.semester;
    data['academic_year'] = this.academicYear;
    data['subject_id'] = this.subjectId;
    return data;
  }
}