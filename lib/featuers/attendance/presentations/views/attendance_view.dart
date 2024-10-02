import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/custom_appbar.dart';
import 'package:student_register/core/widgets/loading_page.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';
import 'package:intl/intl.dart' as intl;
import 'package:student_register/featuers/attendance/presentations/manager/attendance_cubit/attendance_cubit.dart';
import 'package:student_register/featuers/attendance/presentations/manager/attendance_cubit/attendance_state.dart';
import 'package:student_register/featuers/attendance/presentations/views/practical_view.dart';
import 'package:student_register/featuers/attendance/presentations/views/theoretical_view.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';

class AttendanceView extends StatefulWidget {
  Subject subject;
  AttendanceView({super.key, required this.subject});

  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  DateTime? pickedDate;
  DateTime? _selectedDate;
  double h = 1;
  double w = 1;
  bool isPractical = false;
  List<DateTime> practicalDates = [];
  List<DateTime> theoreticalDates = [];
  String formattedDate = '';

  List<Attendance> _attendance = [];
  List<Attendance> _attendanceLab = [];
  List<Attendance> _attendanceTheory = [];

  List<String> _optionType = [
    "lab", "theory",];

  void togglePart() {
    setState(() {
      isPractical = !isPractical;
    });
  }

  String? day ;
  String? date ;
  String? selecttype ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AttendanceCubit>(context).getAttendance(widget.subject.id);

  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(text: isPractical ? 'عملي' : 'نظري', h: h,w:w),


        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: h*0.014, left: w * 0.15, right: w * 0.15),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: !isPractical
                          ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.1, 0.6],
                          tileMode: TileMode.repeated,
                          colors: [kButtonColorGreen1, kButtonColorGreen2],
                        ),
                      )
                          : null,
                      child: TextButton(
                        onPressed: () {
                          if (isPractical) togglePart();
                        },
                        style: TextButton.styleFrom(
                          // backgroundColor: isPractical ? Colors.white : Colors.red,
                        ),
                        child: Text(
                          'نظري',
                          style: TextStyle(
                              fontSize: w*0.04,
                              fontFamily: Almarai,
                              color:Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: isPractical
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.1, 0.6],
                                tileMode: TileMode.repeated,
                                colors: [kButtonColorGreen1, kButtonColorGreen2],
                              ),
                            )
                          : null,
                      child: TextButton(
                        onPressed: () {
                          if (!isPractical) togglePart();
                        },
                        style: TextButton.styleFrom(
                            // backgroundColor: isPractical ? Colors.red : Colors.white,
                            ),
                        child: Text(
                          'عملي',
                          style: TextStyle(
                            fontSize: w*0.04,
                            fontFamily: Almarai,
                              color:Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: h*0.06,),

                ],
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            BlocConsumer<AttendanceCubit, AttendanceState>(
                listener: (context, state) {
              if (state is AttendanceFailure) {

                debugPrint("kkkSubjectFailure");
                  Flushbar(
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.white,
                    messageColor: Colors.black,
                    messageSize: h * 0.02,
                    message: state.errMessage,
                  ).show(context);
                // Navigator.pop(context);
              }
            }, builder: (context, state) {
              if (state is AttendanceSuccess) {
                _attendanceLab = state.attendanceLab;
                _attendanceTheory = state.attendanceTheroy;
                return isPractical
                    ? PracticalView(
                    subjectId: widget.subject.id, listLab: _attendanceLab)
                    : TheoreticalView(
                    subjectId: widget.subject.id,
                        listTheory: _attendanceTheory);
              } else {
                return LoadingPage();
              }
            }),
            SizedBox(
              height: h * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
