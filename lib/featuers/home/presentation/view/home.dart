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
import 'package:student_register/featuers/home/data/model/subject.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';

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
  var SubjectList;

  TextEditingController fullnameController = new TextEditingController();
  TextEditingController fatherController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

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

  List<Subject>? subjectList ;
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
  int? selectedSubject;
  int currentYear = DateTime.now().year;

  int currentStep = 0;

  late Student student;

  void initStatereturn() {
    final isLastStep = currentStep==(getSteps().length -1);
    if(isLastStep) {
      setState(() {
        currentStep=0;
        formkey = GlobalKey<FormState>();
        fullnameController = TextEditingController();
        fatherController = TextEditingController();
        numberController = TextEditingController();
        Student student;

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize currentYear here
     AcademicYear = [
      "${currentYear-1} / ${currentYear }",
       "${currentYear } / ${currentYear +1}",

    ]; // Use currentYear to initialize the list
    print('Current Year: ${currentYear}');

    // Loading();
  }
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
     h = MediaQuery.of(context).size.height;
     w = MediaQuery.of(context).size.width;

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
          toolbarHeight: h*0.09,
          backgroundColor: Color(0xff838AA6),
          title:  TEXT(text: "تسجيل الطالب", w: w * 0.05),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Stepper(
            physics: ClampingScrollPhysics(),
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: currentStep,
            controlsBuilder: (context,_){
              return SizedBox();
            },
          )
        ),
      ),
    );
  }
  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
        title: TEXT( w: w *0.035, text: "بيانات الطالب",),
        content:  Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TEXT(
                text: '  الاسم الثلاثي * ',
                w: w * 0.035,
              ),
              BoxController(
                  controller: fullnameController,
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
                text: 'الرقم الامتحاني',
                w: w * 0.035,
              ),
              BoxController(
                  controller: numberController,
                  h: h,
                  w: w,
                  textInputType: TextInputType.text,
                  validate: false),
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
              SizedBox(
                height: h * 0.03,
              ),
              BlocConsumer<SSCubit,ListState>(
                  builder: (context,state){
                    if(state is SubjectListLoading){
                      return Loading(h: h, w: w);
                    }
                    else{
                      return InkWell(
                        onTap: (){
                          if(formkey.currentState!.validate()){
                            BlocProvider.of<SSCubit>(context).getSubject();
                          }
                        },
                        child: Button(h: h,w: w,text: "التالي",),
                      );
                    }
                  },
                  listener: (context,state){
                    if(state is SubjectListSuccess){
                      subjectList = state.subject;
                      SubjectList = subjectList?.map((e) => DropdownMenuItem<int>(
                        value: e.id,
                        child: TEXT(text: e.subjectName!,w: w*0.035,),
                      ));
                      setState(() {
                        currentStep +=1;
                      });
                    }
                    if (state is SubjectListFailure){
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: "error",
                      ).show(context);

                    }
                  }
              )
            ],
          ),
        ),
    ),
    Step(
        isActive: currentStep >= 0,
        title: TEXT( w: w *0.035, text: "اختر المادة",),
        content: Column(
          children: [

            SizedBox(
              height: h * 0.03,
            ),
            DropDownWidget(
              list: SubjectList,
              w: w,
              text: 'المادة',
              selected: selectedSubject,
              onChanged:  (value) {
                setState(() {
                  selectedSubject = value;
                });
                print(selectedSubject);
              },
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      currentStep -=1;
                    });
                  },
                  child: Button(h: h,w: w,text: "السابق",),
                ),
                BlocConsumer<SSCubit,ListState>(
                    builder: (context,state){
                      if(state is StudentListLoading){
                        return Loading(h: h, w: w);
                      }
                      else{
                        return InkWell(
                          onTap: (){
                            if(selectedSubject! != null){
                              student = Student(
                                  fullName: fullnameController.text,
                                  fatherName: fatherController.text,
                                  status: selectedStatus,
                                  year: selectedYear,
                                  section: selectedSection,
                                  semester: selectedSemester,
                                  academicYear: selectedAcademicYear,
                                  subjectId: selectedSubject
                              );
                              if(numberController.text != null){
                                student.examNumber = numberController.text;
                              }
                              BlocProvider.of<SSCubit>(context).addStudent(student);
                            }
                          },
                          child: Button(h: h,w: w,text: "التالي",),
                        );
                      }
                    },
                    listener: (context,state){
                      if(state is SubjectListSuccess){
                        setState(() {
                          currentStep +=1;
                        });
                      }
                      if (state is SubjectListFailure){
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message: "message",
                        ).show(context);

                      }
                    }
                )
              ],
            )
          ],
        )
    ),
    Step(
      isActive: currentStep >= 2,
        title: TEXT(text: "تم",w: w*0.035,),
        content: Column(
          children: [
            TEXT(text: "تم الاضافة",w: w*0.035,)
          ],
        )
    )
  ];
}
