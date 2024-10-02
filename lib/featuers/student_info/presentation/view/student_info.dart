import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/box_controller_hint.dart';
import 'package:student_register/core/widgets/button_loading.dart';
import 'package:student_register/core/widgets/custom_appbar.dart';
import 'package:student_register/core/widgets/custom_button_auth.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/view/my_subject.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/state.dart';
import 'package:student_register/featuers/student_info/presentation/manager/update_cubit/update_cubit.dart';
import 'package:student_register/featuers/student_info/presentation/manager/update_cubit/update_state.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';

class StudentInfo extends StatefulWidget {
  StudentInfo({
    Key? key,
  }) : super(key: key);

  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  late StudentInfoModel studentinfo;

  TextEditingController exam_numberController = new TextEditingController();
  TextEditingController academic_yearController = new TextEditingController();
  var AcademicYearList;
  // List<int> AcademicYear = academicYearCon;
  List<AcademicSemester> AcademicYear = academicYearCon;
  int? selectedAcademicYear;
  double h = 1;
  double w = 1;
  String? selecteAcademicYearString;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // AcademicYearList =
    //     AcademicYear.map((e) => DropdownMenuItem<String>(
    //   value: e.toString(),
    //   child: TEXT(text: e.toString(), w: w * 0.035),
    // )).toList();
    AcademicYearList =
        AcademicYear.map<DropdownMenuItem<String>>((AcademicSemester as) {
      return DropdownMenuItem<String>(
        value: as.acadsemester,
        child: TEXT(text: as.acadsemester, w: w * 0.035),
      );
    }).toList();

    // selectedAcademicYear = AcademicYear
    //     .firstWhere((dept) => dept.id == BlocProvider.of<StudentInfoListCubit>(context).studentInfoB!.academic_year)
    //     .id;

    if( BlocProvider.of<StudentInfoListCubit>(context).studentInfoB.academic_year != null ){
      selecteAcademicYearString = AcademicYear.firstWhere((dept) =>
          dept.id ==
          BlocProvider.of<StudentInfoListCubit>(context)
              .studentInfoB!
              .academic_year).acadsemester ;}


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(text: 'استكمال بيانات الطالب', h: h, w: w),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TEXT(
                  text: ' الطالب ',
                  w: w * 0.04,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TEXT(
                  text: BlocProvider.of<AuthCubit>(context).first_name! +
                      ' ' +
                      BlocProvider.of<AuthCubit>(context).father_name! +
                      ' ' +
                      BlocProvider.of<AuthCubit>(context).last_name!,
                  w: w * 0.035,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TEXT(
                  text: ' القسم ',
                  w: w * 0.04,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TEXT(
                  text: BlocProvider.of<DepartmentCubit>(context)
                      .department
                      .firstWhere((s) =>
                          s.id ==
                          int.parse(BlocProvider.of<AuthCubit>(context)
                              .department_id))
                      .name,
                  w: w * 0.035,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TEXT(
                  text: ' الرقم الامتحاني ',
                  w: w * 0.035,
                ),
                BoxControllerHint(
                  controller: exam_numberController,
                  h: h,
                  w: w,
                  label: (BlocProvider.of<StudentInfoListCubit>(context)
                              .studentInfoB.exam_number !=
                          null)
                      ? BlocProvider.of<StudentInfoListCubit>(context)
                          .studentInfoB!
                          .exam_number
                          .toString()
                      : "ادخل الرقم الامتحاني",
                  textInputType: TextInputType.text,
                  validate: false,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                TEXT(
                  text: ' السنة الدراسية ',
                  w: w * 0.035,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                DropDownWidget(
                  list: AcademicYearList,
                  w: w,
                  text:
                  // (BlocProvider.of<StudentInfoListCubit>(context)
                  //             .studentInfoB !=
                  //         null)
                  //     ? BlocProvider.of<StudentInfoListCubit>(context)
                  //         .studentInfoB!
                  //         .academic_year
                  //         .toString()
                  //     :
                  'السنة الدراسية',
                  selected: selecteAcademicYearString,
                  // AcademicYear
                  //     .firstWhere(
                  //       (dept) => dept.id == selectedAcademicYear,
                  //   // orElse: () => AcademicYear[0]
                  // )
                  //     .acadsemester,
                  onChanged: (value) {
                    setState(() {
                      selecteAcademicYearString = value;
                      selectedAcademicYear = AcademicYear.firstWhere(
                          (dept) => dept.acadsemester == value).id;
                    });
                    print(selectedAcademicYear);
                  },
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                BlocConsumer<UpdateStudentInfoListCubit,
                    UpdateStudentInfoListState>(builder: (context, state) {
                  if (state is UpdateStudentInfoListLoading) {
                    return ButtonLoading();
                    // Loading(h: h, w: w);
                  } else {
                    return CustomButtonAuth(
                      text: 'تأكيد',
                      onPressed: () {
                        studentinfo = StudentInfoModel(
                          academic_year: selectedAcademicYear,
                          exam_number: exam_numberController.text,
                        );
                        // if(numberController.text != null){
                        //   student.examNumber = numberController.text;
                        // }
                        BlocProvider.of<UpdateStudentInfoListCubit>(context)
                            .updateStudentInfo(studentinfo);
                      },
                    );
                  }
                }, listener: (context, state) {
                  if (state is UpdateStudentInfoListSuccess) {
                    BlocProvider.of<StudentInfoListCubit>(context)
                        .updateStudentInfoLocal(state.studentinfo);
                    Flushbar(
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.white,
                      messageColor: Colors.black,
                      messageSize: h * 0.02,
                      message: "تمت العملية بنجاح",
                    ).show(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MySubject()),
                      ModalRoute.withName('/mySubjectView'),
                    );
                  }

                  if (state is UpdateStudentInfoListFailure) {
                    Flushbar(
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.white,
                      messageColor: Colors.black,
                      messageSize: h * 0.02,
                      message: state.errMessage,
                    ).show(context);
                  }
                })
              ]),
        ),
      ),
    );
  }
}
