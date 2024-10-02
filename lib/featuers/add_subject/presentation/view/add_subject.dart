import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/button.dart';
import 'package:student_register/core/widgets/custom_appbar.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/loading.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/add_subject/data/model/subject_student.dart';
import 'package:student_register/featuers/add_subject/presentation/manager/cubit/subject_cubit.dart';
import 'package:student_register/featuers/add_subject/presentation/manager/cubit/subject_state.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';


class AddSubject extends StatefulWidget {
  AddSubject({Key? key}) : super(key: key);

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
  List<String> Status = statusCon;
  List<AcademicSemester> AcademicYear = academicYearCon;
  List<AcademicSemester> Semester = semesterCon;

  List<Subject>? subjectList ;
  DateTime now = DateTime.now();
  int currentYear = DateTime.now().year;
  List<String>? Year;
  var formkey = GlobalKey<FormState>();

  String? selectedStatus;
  String? selectedYear;
  int? selectedSemester;
  int? selectedAcademicYear;
  int? selectedSubject;
  // int currentYear = DateTime.now().year;
  String? selecteAcademicYearString;
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
        selecteAcademicYearString = null;
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
    // AcademicYearList = AcademicYear.map((e) => DropdownMenuItem<String>(
    //   value: e.toString(),
    //   child: TEXT(text: e.toString(), w: w * 0.035),
    // )).toList();
    AcademicYearList = AcademicYear.map<DropdownMenuItem<String>>(
            (AcademicSemester as) {
          return DropdownMenuItem<String>(
              value: as.acadsemester,
              child: TEXT(text: as.acadsemester, w: w * 0.035),);
        }).toList();

    SemesterList = Semester.map((e) => DropdownMenuItem<String>(
      value: e.toString(),
      child: TEXT(text: e.toString(), w: w * 0.035),
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
          appBar: CustomAppBar(text: 'تسجيل مادة', h: h,w:w),

          body: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child:  Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: kButtonColorGreen1), // Primary color
                ),
                child: Stepper(
                  physics: ClampingScrollPhysics(),
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  controlsBuilder: (context,_){
                    return SizedBox();
                  },
                ),
              )
          )

      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
      title: TEXT( w: w *0.035, text: "العام الدراسي للمادة ",),
      content:  Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropDownWidget(
              list: AcademicYearList,
              w: w,
              text: 'السنة الدراسية',
              selected:selecteAcademicYearString,
              // selectedAcademicYear,
              // AcademicYear
              //     .firstWhere(
              //         (dept) => dept.id == selectedAcademicYear,
              //     orElse: () => AcademicYear[0]
              // )
              //     .acadsemester,
              onChanged:  (value) {
                setState(() {
                  selecteAcademicYearString = value;
                  selectedAcademicYear = AcademicYear
                      .firstWhere((dept) => dept.acadsemester == value)
                      .id;
                });
                print(selectedAcademicYear.toString());
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
                            "academic_year" : selectedAcademicYear!,
                            "department_id" : BlocProvider.of<AuthCubit>(context).department_id,
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
                        message: state.errMessage,
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
                            if( BlocProvider.of<StudentInfoListCubit>(context).studentInfoB.academic_year != null ){
                              if(selectedSubject! != null) {
                                subjectstudent = SubjectStudent(
                                  subject_id:selectedSubject,
                                  status: selectedStatus,
                                  // exam_number: BlocProvider.of<StudentInfoListCubit>(context).studentInfoB!.exam_number,
                                  academic_year: BlocProvider.of<StudentInfoListCubit>(context).studentInfoB!.academic_year,// to student
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
                                message: "تأكد من ادخال العام الدراسي ",
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
                            message: state.errMessage,
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
