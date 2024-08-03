import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/button.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/loading.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/mysubject/data/model/subject_student.dart';
import 'package:student_register/featuers/mysubject/presentation/manager/cubit/subject_cubit.dart';
import 'package:student_register/featuers/mysubject/presentation/manager/cubit/subject_state.dart';
import 'package:student_register/repository.dart';


class AddSubject extends StatefulWidget {
  Repository repository;
  AddSubject({Key? key,required this.repository}) : super(key: key);

  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  var StatusList;
  var YearList;
  var SemesterList;
  var AcademicYearList;
  var SubjectList;

  TextEditingController numberController = new TextEditingController();
  List<String> Status = ["مستجد", "إعادة","تنزيل"];
  List<String> AcademicYear = ["أولى", "ثانية", "ثالثة", "رابعة", "خامسة"];
  List<String> Semester = ["الفصل الأول", "الفصل الثاني"];

  List<Subject>? subjectList ;
  DateTime now = DateTime.now();
  int currentYear = DateTime.now().year;
  List<String>? Year;
  var formkey = GlobalKey<FormState>();

  String? selectedStatus;
  String? selectedYear;
  String? selectedSemester;
  String? selectedAcademicYear;
  int? selectedSubject;
  // int currentYear = DateTime.now().year;

  int currentStep = 0;

  void initStatereturn() {
    final isLastStep = currentStep==(getSteps().length -1);
    if(isLastStep) {
      setState(() {
        currentStep=0;
        formkey = GlobalKey<FormState>();
        numberController = TextEditingController();
        selectedStatus = null;
        selectedYear = null;
        selectedSemester = null;
        selectedAcademicYear = null;
        selectedSubject = null;
      });
    }
  }
  late SubjectStudent subjectstudent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Initialize currentYear here
    Year = [
      "${currentYear-1}/${currentYear}",
      "${currentYear}/${currentYear+1}",

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
    AcademicYearList = AcademicYear.map((e) => DropdownMenuItem<String>(
      value: e,
      child: TEXT(text: e, w: w * 0.035),
    )).toList();

    SemesterList = Semester.map((e) => DropdownMenuItem<String>(
      value: e,
      child: TEXT(text: e, w: w * 0.035),
    )).toList();

    YearList = Year?.map((e) => DropdownMenuItem<String>(
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
            backgroundColor: Color(0x24F10808),
            title:  TEXT(text: 'تسجيل مادة', w: w * 0.05),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child:  Stepper(
                physics: ClampingScrollPhysics(),
                type: StepperType.vertical,
                steps: getSteps(),
                currentStep: currentStep,
                controlsBuilder: (context,_){
                  return SizedBox();
                },
              )
          )

      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
      // title: TEXT( w: w *0.035, text: "بيانات الطالب",),
      title: TEXT( w: w *0.035, text: "العام الدراسي للمادة ",),
      content:  Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TEXT(
            //   text: 'الرقم الامتحاني',
            //   w: w * 0.035,
            // ),
            // BoxController(
            //     controller: numberController,
            //     h: h,
            //     w: w,
            //     textInputType: TextInputType.text,
            //     validate: false),
            // SizedBox(
            //   height: h * 0.03,
            // ),
            //
            // DropDownWidget(
            //   list: YearList,
            //   w: w,
            //   text: 'السنة',
            //   selected: selectedYear,
            //   onChanged:  (value) {
            //     setState(() {
            //       selectedYear = value;
            //     });
            //     print(selectedYear);
            //   },
            // ),
            //
            // SizedBox(
            //   height: h * 0.03,
            // ),
            // DropDownWidget(
            //   list: SemesterList,
            //   w: w,
            //   text: 'الفصل',
            //   selected: selectedSemester,
            //   onChanged:  (value) {
            //     setState(() {
            //       selectedSemester = value;
            //     });
            //     print(selectedSemester);
            //   },
            // ),
            // SizedBox(
            //   height: h * 0.03,
            // ),
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
            BlocConsumer<SubjectCubit,ListSubjectState>(
                builder: (context,state){
                  if(state is SubjectListLoading){
                    return Loading(h: h, w: w);
                  }
                  else{
                    return InkWell(
                      onTap: (){
                        if(
                            // selectedYear! != null
                            // && selectedSemester! != null
                            // &&
                        selectedAcademicYear! != null
                        ){
                          Map<String,dynamic> dataa = {
                            // "year" : selectedYear,
                            // "semester" : selectedSemester,
                            "academic_year" : selectedAcademicYear
                          };
                          BlocProvider.of<SubjectCubit>(context).getSubject(dataa);
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
                    )).toList();
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
                      message: "لا يمكن اتمام العملية الأن",
                    ).show(context);

                  }
                }
            )
          ],
        ),
      ),
    ),
    Step(
        isActive: currentStep >= 1,
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
                BlocConsumer<SubjectCubit,ListSubjectState>(
                    builder: (context,state){
                      if(state is SubjectSListLoading){
                        return Loading(h: h, w: w);
                      }
                      else{
                        return InkWell(
                          onTap: (){
                            if(widget.repository.studentinfomodel!.exam_number != null && widget.repository.studentinfomodel!.academic_year != null ){
                              if(selectedSubject! != null){
                                subjectstudent = SubjectStudent(
                                  student_id:widget.repository.login!.id,
                                  subject_id:selectedSubject,
                                  status: selectedStatus,
                                  // year: selectedYear,
                                  // semester: selectedSemester,
                                  exam_number: widget.repository.studentinfomodel!.exam_number,
                                  academic_year: widget.repository.studentinfomodel!.academic_year,// to student
                                );
                                if(numberController.text != null){
                                  subjectstudent.exam_number = numberController.text;
                                }
                                BlocProvider.of<SubjectCubit>(context).addSSubject(subjectstudent);
                              }
                            }
                            else {
                              Flushbar(
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.white,
                                messageColor: Colors.black,
                                messageSize: h * 0.02,
                                message: "تأكد من ادخال الرقم الامتحاني أو العام الدراسي ",
                              ).show(context);
                            }

                          },
                          child: Button(h: h,w: w,text: "التالي",),
                        );
                      }
                    },
                    listener: (context,state){
                      if(state is SubjectSListSuccess){
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message: "تمت العملية بنجاح",
                        ).show(context);
                        setState(() {
                          currentStep +=1;
                        });
                        Timer( Duration(seconds: 10),() {
                          initStatereturn();
                        });
                      }
                      if (state is SubjectSListFailure){
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
