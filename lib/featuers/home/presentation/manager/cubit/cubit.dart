import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_register/featuers/home/data/model/student.dart';
import 'package:student_register/featuers/home/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SSCubit extends Cubit<ListState>{
  SSCubit(this.fetchStudentUseCase, this.fetchSubjectUseCase) : super(ListInitial());


 final FetchStudentUseCase fetchStudentUseCase;
 final FetchSubjectUseCase fetchSubjectUseCase ;

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

  Future<void> getSubject() async{
    emit(SubjectListLoading());
    debugPrint("1");
    var result = await  fetchSubjectUseCase.callGet();

    result.fold((failure) {

      emit(SubjectListFailure(failure.message));
    }, (subject) {
      emit(SubjectListSuccess(subject));
    });
  }

}