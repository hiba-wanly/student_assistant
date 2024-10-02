import 'package:flutter/material.dart';


String Almarai = 'Almarai';

const kLoginBox = 'login_box';
const kStudentInfoBox = 'student_info_box';


const serverApi = 'http://213.199.32.188:8051/';
// 'http://213.199.32.188:8051/' server
// http://192.168.43.59:8000/  my lap

List<AcademicSemester> academicYearCon= [
  AcademicSemester(id:1 , acadsemester:"السنة الأولى"),
  AcademicSemester(id:2 , acadsemester:"السنة الثانية"),
  AcademicSemester(id:3 , acadsemester:"السنة الثالثة"),
  AcademicSemester(id:4 , acadsemester:"السنة الرابعة"),
  AcademicSemester(id:5 , acadsemester:"السنة الخامسة"),
];

List<String> statusCon = ["مستجد", "إعادة","تنزيل"];
List<AcademicSemester> semesterCon = [
  AcademicSemester(id:1 , acadsemester:"الفصل الأول"),
  AcademicSemester(id:2 , acadsemester:"الفصل الثاني"),
];

class AppImagesAssets{
  // static const String welcomeImg ='assets/images/img.png' ;
  static const String logo ="assets/images/unv_2.png" ;
  static const String loading ="assets/images/loader.gif" ;
}


const kPrimaryColor = Color(0xffffffff);

const kButtonColor = Color(0xfff9f9f9);

const kButtonColorGreen1 = Color(0xff009688);
const kButtonColorGreen2 = Color(0xff4DB6AC);


class AcademicSemester{
  int id;
  String acadsemester;
  AcademicSemester({
   required this.id,
    required this.acadsemester
});
}