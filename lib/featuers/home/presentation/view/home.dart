import 'package:another_flushbar/flushbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/button.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/loading.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/presentation/view/load_student_info.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';
import 'package:student_register/featuers/mysubject/presentation/view/my_subject.dart';
import 'package:student_register/repository.dart';

class HomeView extends StatefulWidget {
  Repository repository;
   HomeView({Key? key, required this.repository}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var SectionList;


  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController fatherController = new TextEditingController();


  List<String> Section = [
    " هندسة الحواسيب والأتمتة",
    " الهندسة الطبية",
    " الالكترونيات و الاتصالات",
    " هندسة الطاقة الكهربائية",
    " هندسة السيارات والآليات الثقيلة",
    " هندسة التصميم الميكانيكي",
    " هندسة الميكانيك العام",
    " هندسة ميكانيك الصناعات النسيجية و تقاناتها",
    // "هندسة الحواسيب و الأتمتة /شعبة التحكم الآلي/",
    // "هندسة الطاقة الكهربائية /شعبة الطاقات المتجددة/",
    // "هندسة التصميم الميكانيكي /اختصاص هندسة التصميم الميكانيكي و الانتاج/",
    // "قسم هندسة الميكانيك العام /شعبة الطاقات المتجددة/",
  ];


  // List<String> AcademicYearList = [
  //   "${currentYear} / ${currentYear-1}",
  //   // "2024 / 2023","2023 / 2022"
  // ];

  var formkey = GlobalKey<FormState>();


  String? selectedSection;

  int currentYear = DateTime.now().year;

  int currentStep = 0;

  late Student student;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize currentYear here
    //  AcademicYear = [
    //   "${currentYear-1} / ${currentYear }",
    //    "${currentYear } / ${currentYear +1}",
    //
    // ]; // Use currentYear to initialize the list
    // print('Current Year: ${currentYear}');

    // Loading();
  }
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
     h = MediaQuery.of(context).size.height;
     w = MediaQuery.of(context).size.width;



    SectionList = Section.map((e) => DropdownMenuItem<String>(
          value: e,
          child: TEXT(text: e, w: w * 0.035),
        )).toList();



    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   toolbarHeight: h*0.09,
        //   backgroundColor: Color(0xff838AA6),
        //   title:  TEXT(text: "تسجيل الطالب", w: w * 0.05),
        //   centerTitle: true,
        // ),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.2,
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Form(
            key: formkey,
            child: Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TEXT(
                      text: '  إنشاء حساب ',
                      w: w * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TEXT(
                    text: '  الاسم الأول * ',
                    w: w * 0.035,
                  ),
                  BoxController(
                    controller: firstnameController,
                    h: h,
                    w: w,
                    textInputType: TextInputType.text,
                    validate: true,),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TEXT(
                    text: '  الكنية * ',
                    w: w * 0.035,
                  ),
                  BoxController(
                    controller: lastnameController,
                    h: h,
                    w: w,
                    textInputType: TextInputType.text,
                    validate: true,),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TEXT(
                    text: 'اسم الأب * ',
                    w: w * 0.035,
                  ),
                  BoxController(
                      controller: fatherController,
                      h: h,
                      w: w,
                      textInputType: TextInputType.text,
                      validate: true),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TEXT(
                    text: 'القسم * ',
                    w: w * 0.035,
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  DropDownWidget(
                    list: SectionList,
                    w: w,
                    text: 'القسم الذي تدرس به ',
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
              BlocConsumer<SSCubit,ListState>(
                                  builder: (context,state){
                                    if(state is StudentListLoading){
                                      return  Container(
                                        width: w,
                                        height: h*0.06,
                                        margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
                                        child: MaterialButton(
                                          onPressed: (){
                                          },
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          padding:  EdgeInsets.symmetric(vertical: h*0.02),
                                          color: const Color(0x24F10808),
                                          textColor: Colors.white,
                                          child:  Padding(
                                            padding: EdgeInsets.only(left: w * 0.05,right: w * 0.05),
                                            child: const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        ),
                                      );

                                        // Loading(h: h, w: w);
                                    }
                                    else{
                                      return
                                        Container(
                                          width: w,
                                          height: h*0.065,
                                          margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
                                          child: MaterialButton(
                                            onPressed: (){
                                              if(formkey.currentState!.validate() && selectedSection! != null){
                                                student = Student(
                                                  firstName: firstnameController.text,
                                                  lastName: lastnameController.text,
                                                  fatherName: fatherController.text,
                                                  // status: selectedStatus,
                                                  // year: selectedYear,
                                                  section: selectedSection,
                                                  // semester: selectedSemester,
                                                  // academicYear: selectedAcademicYear,
                                                  // subjectId: selectedSubject
                                                );
                                                // if(numberController.text != null){
                                                //   student.examNumber = numberController.text;
                                                // }
                                                BlocProvider.of<SSCubit>(context).addStudent(student);
                                              }
                                            },
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            padding:  EdgeInsets.symmetric(vertical: h*0.02),
                                            color: const Color(0x24F10808),
                                            textColor: Colors.white,
                                            child:  TEXT(
                                              text: ' تأكيد ',
                                              w: w * 0.035,
                                            ),
                                          ),
                                        )
                                      ;
                                    }
                                  },
                                  listener: (context,state){
                                    if(state is StudentListSuccess){
                                      widget.repository.login = state.student;
                                      Flushbar(
                                        duration: const Duration(seconds: 3),
                                        backgroundColor: Colors.white,
                                        messageColor: Colors.black,
                                        messageSize: h * 0.02,
                                        message: "تمت العملية بنجاح",
                                      ).show(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoadStudentInfo(repository: widget.repository)
                                        ),
                                      );
                                      // setState(() {
                                      //   currentStep +=1;
                                      // });
                                      // Timer( Duration(seconds: 10),() {
                                      //   initStatereturn();
                                      // });
                                    }
                                    if (state is StudentListFailure){
                                      Flushbar(
                                        duration: const Duration(seconds: 3),
                                        backgroundColor: Colors.white,
                                        messageColor: Colors.black,
                                        messageSize: h * 0.02,
                                        message: "لا يمكن اتمام العملية الان",
                                      ).show(context);

                                    }
                                  }
                              )
                ],
              ),
            ),
          )

        ),
      ),
    );
  }

}
