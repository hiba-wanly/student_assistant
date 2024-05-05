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
    id = json['id'];
    subjectName = json['subject_name'];
    academicYear = json['academic_year'];
    section = json['section'];
    semester = json['semester'];
    year = json['year'];
    studyMark = json['study_mark'];
    attendanceMark = json['attendance_mark'];
    workMark = json['work_mark'];
    laboratoryMark = json['laboratory_mark'];
    totalMark = json['total_mark'];
    numberOfPraccticalSessions = json['number_of_pracctical_sessions'];
    numberOfTheoreticalSessions = json['number_of_theoretical_sessions'];
    studyMarkFrom = json['study_mark_from'];
    workMarkFrom = json['work_mark_from'];
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