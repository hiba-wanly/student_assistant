import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/home/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SSCubit extends Cubit<ListState>{
  SSCubit(this.fetchStudentUseCase, this.fetchStudentInfoUseCase) : super(ListInitial());


 final FetchStudentUseCase fetchStudentUseCase;
 final FetchStudentInfoUseCase fetchStudentInfoUseCase;

  Future<void> fetchLogin() async{
    emit(StudentListLoading());

    var result = await  fetchStudentUseCase.call();

    result.fold((failure) {

      emit(StudentListFailure(failure.message));
    }, (student) {
      emit(StudentListSuccess(student));
    });


  }

  Future<void> addStudent(Student student) async{
    emit(StudentListLoading());
    Map<String, dynamic> data1 = student.toJson();
   debugPrint(data1.toString());
   var result = await  fetchStudentUseCase.callAdd(data1);

   result.fold((failure) {

     emit(StudentListFailure(failure.message));
   }, (student) {
     emit(StudentListSuccess(student));
   });


  }


  Future<void> updateStudentInfo(StudentInfoModel studentInfo, int id_student) async{
    emit(StudentInfoListLoading());
    Map<String, dynamic> data1 = studentInfo.toJson();
    debugPrint(data1.toString());
    var result = await  fetchStudentInfoUseCase.callupdateStudentInfo(data1, id_student);

    result.fold((failure) {

      emit(StudentInfoListFailure(failure.message));
    }, (student) {
      emit(StudentInfoListSuccess(student));
    });
  }

  Future<void> getStudentInfo(int id_student) async{
    emit(StudentInfoListLoading());

    var result = await  fetchStudentInfoUseCase.callGetStudentInfo( id_student);

    result.fold((failure) {

      emit(StudentInfoListFailure(failure.message));
    }, (student) {
      emit(StudentInfoListSuccess(student));
    });
  }



}