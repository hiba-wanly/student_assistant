import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var StatusList;
  var YearList;
  var SectionList;
  var SemesterList;
  var AcademicYearList;

  TextEditingController personController = new TextEditingController();
  List<String> Status = ["مستجد", "إعادة"];
  List<String> Year = ["أولى", "ثانية", "ثالثة", "رابعة", "خامسة"];
  List<String> Section = [
    "قسم هندسة الحواسيب والأتمتة",
    "قسم الهندسة الطبية",
    "قسم الالكترونيات و الاتصالات",
    "قسم هندسة الطاقة الكهربائية",
    "قسم هندسة السيارات والآليات الثقيلة",
    "قسم العلوم الأساسية",
    "قسم هندسة التصميم الميكانيكي",
    "قسم هندسة الميكانيك العام",
    "قسم هندسة ميكانيك الصناعات النسيجية و تقاناتها",
    "هندسة الحواسيب و الأتمتة /شعبة التحكم الآلي/",
    "هندسة الطاقة الكهربائية /شعبة الطاقات المتجددة/",
    "هندسة التصميم الميكانيكي /اختصاص هندسة التصميم الميكانيكي و الانتاج/",
    "قسم هندسة الميكانيك العام /شعبة الطاقات المتجددة/",
  ];
  List<String> Semester = ["الفصل الأول", "الفصل الثاني"];
  // DateTime now = DateTime.now();
  // int currentYear = DateTime.now().year;

  // List<String> AcademicYearList = [
  //   "${currentYear} / ${currentYear-1}",
  //   // "2024 / 2023","2023 / 2022"
  // ];
  List<String>? AcademicYear;
  var formkey = GlobalKey<FormState>();

  String? selectedStatus;
  String? selectedYear;
  String? selectedSection;
  String? selectedSemester;
  String? selectedAcademicYear;
  int currentYear = DateTime.now().year;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize currentYear here
     AcademicYear = [
      "${currentYear} / ${currentYear - 1}",
    ]; // Use currentYear to initialize the list
    print('Current Year: ${currentYear}');

    // Loading();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    StatusList = Status.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();
    YearList = Year.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();

    SectionList = Section.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();

    SemesterList = Semester.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();

    AcademicYearList = AcademicYear?.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();
    print(AcademicYearList);
    StatusList = Status.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff838AA6),
          title: const Text("تسجيل طالب"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TEXT(
                      text: 'الاسم الثلاثي',
                      w: w * 0.035,
                    ),
                    BoxController(
                        controller: personController,
                        h: h,
                        w: w,
                        textInputType: TextInputType.text),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TEXT(
                      text: 'اسم الأب',
                      w: w * 0.035,
                    ),
                    BoxController(
                        controller: personController,
                        h: h,
                        w: w,
                        textInputType: TextInputType.text),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TEXT(
                      text: 'الرقم الامتحاني',
                      w: w * 0.035,
                    ),
                    BoxController(
                        controller: personController,
                        h: h,
                        w: w,
                        textInputType: TextInputType.text),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    DropDownWidget(
                      list: StatusList,
                      w: w,
                      text: " حالة الطالب",
                      selected: selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                        print(selectedStatus);
                      },
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    DropDownWidget(
                      list: YearList,
                      w: w,
                      text: 'السنة',
                      selected: selectedYear,
                      onChanged:  (value) {
                        setState(() {
                          selectedYear = value;
                        });
                        print(selectedYear);
                      },
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    DropDownWidget(
                      list: SectionList,
                      w: w,
                      text: 'القسم',
                      selected: selectedSection,
                      onChanged: (value) {
                        setState(() {
                          selectedSection = value;
                        });
                        print(selectedSection);
                      },
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    DropDownWidget(
                      list: SemesterList,
                      w: w,
                      text: 'الفصل',
                      selected: selectedSemester,
                      onChanged:  (value) {
                        setState(() {
                          selectedSemester = value;
                        });
                        print(selectedSemester);
                      },
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    DropDownWidget(
                      list: AcademicYearList,
                      w: w,
                      text: 'السنة الدراسية',
                      selected: selectedAcademicYear,
                      onChanged:  (value) {
                        setState(() {
                          selectedAcademicYear = value;
                        });
                        print(selectedAcademicYear);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
