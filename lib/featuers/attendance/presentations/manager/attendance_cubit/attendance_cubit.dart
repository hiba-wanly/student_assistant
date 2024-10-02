import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';
import 'package:student_register/featuers/attendance/domain/use_cases/fetch_attendance_use_case.dart';
import 'package:student_register/featuers/attendance/presentations/manager/attendance_cubit/attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.fetchAttendanceUseCase) : super(AttendanceInitial());

  final FetchAttendanceUseCase fetchAttendanceUseCase;



  Future<void> getAttendance( int sub_id) async {
    emit(AttendanceLoading());
    var result = await fetchAttendanceUseCase.callGetAttendance( sub_id);

    result.fold((failure) {
      emit(AttendanceFailure(failure.message));
    }, (attendance) {
      var filtered = filterAttendance(attendance);
      // Access the lab and theory lists using their keys
      List<Attendance> labList = filtered['lab'] ?? [];
      List<Attendance> theoryList = filtered['theory'] ?? [];

      emit(AttendanceSuccess(labList ,theoryList ));    });
  }



  Map<String, List<Attendance>> filterAttendance(List<Attendance> attendanceList){
    List<Attendance> listLab = [];
    List<Attendance> listTheory = [];

    for (var attendance in attendanceList) {
      if (attendance.type == 'lab') {
        listLab.add(attendance);
      } else if (attendance.type == 'theory') {
        listTheory.add(attendance);
      }
    }
    return {
      'lab': listLab,
      'theory': listTheory,
    };
  }

}
