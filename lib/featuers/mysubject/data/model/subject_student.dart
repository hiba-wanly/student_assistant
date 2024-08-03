class SubjectStudent{
  dynamic id;
  int? student_id ;
  int? subject_id ;
 dynamic exam_number ;
  String? status ;
  String? year ;
  String? semester ;
  String? academic_year ;

  SubjectStudent(
      {
        required   this.student_id,
        required   this.subject_id,
        this.exam_number,
        required  this.status,
          this.year,
         this.semester,
        required  this.academic_year,
      });

  SubjectStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student_id = json['subject_id'];
    subject_id = json['subject_id'];
    exam_number = json['exam_number'];
    status = json['status'];
    // year = json['year'];
    // semester = json['semester'];
    academic_year = json['academic_year'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_number'] = this.exam_number;
    data['status'] = this.status;
    // data['year'] = this.year;
    // data['semester'] = this.semester;
    data['academic_year'] = this.academic_year;
    data['student_id'] = this.student_id;
    data['subject_id'] = this.subject_id;
    return data;
  }

}