import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
import 'package:student_register/featuers/student_info/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/state.dart';

class StudentInfoListCubit extends Cubit<StudentInfoListState>{
  StudentInfoListCubit( this.fetchStudentInfoUseCase,
  ) : super(StudentInfoListInitial());


 final FetchStudentInfoUseCase fetchStudentInfoUseCase;

  late StudentInfoModel studentInfoB;


  Future<void> updateStudentInfo(StudentInfoModel studentInfo) async{
    emit(StudentInfoListLoading());
    Map<String, dynamic> data1 = studentInfo.toJson();
    debugPrint(data1.toString());
    var result = await  fetchStudentInfoUseCase.callupdateStudentInfo(data1);

    result.fold((failure) {

      emit(StudentInfoListFailure(failure.message));
    }, (student) {
      updateStudentInfoLocal(student);
      emit(StudentInfoListSuccess(student));
    });
  }

  Future<void> getStudentInfo() async{
    emit(StudentInfoListLoading());

    var result = await  fetchStudentInfoUseCase.callGetStudentInfo();

    result.fold((failure) {

      emit(StudentInfoListFailure(failure.message));
    }, (student) {
      updateStudentInfoLocal(student);
      emit(StudentInfoListSuccess(student));
    });
  }

  void updateStudentInfoLocal(StudentInfoModel studentInfoBN ) {
    studentInfoB = studentInfoBN;
    emit(StudentInfoListSuccess(studentInfoB));
  }



}