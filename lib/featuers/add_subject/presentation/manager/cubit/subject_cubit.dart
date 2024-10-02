import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/featuers/add_subject/data/model/subject_student.dart';
import 'package:student_register/featuers/add_subject/domain/use_case/ss_fetch_use_case.dart';
import 'package:student_register/featuers/add_subject/presentation/manager/cubit/subject_state.dart';

class SubjectCubit extends Cubit<ListSubjectState> {
  SubjectCubit(this.fetchSubjectUseCase, this.fetchStudentSubjectUseCase)
      : super(SubjectListInitial());

  final FetchSubjectUseCase fetchSubjectUseCase;
  final FetchStudentSubjectUseCase fetchStudentSubjectUseCase;

  Future<void> getSubject(Map<String, dynamic> dataa) async {
    emit(SubjectListLoading());
    debugPrint("1");
    var result = await fetchSubjectUseCase.callGet(dataa);

    result.fold((failure) {
       emit(SubjectListFailure(failure.message));
    }, (subject) {
      emit(SubjectListSuccess(subject));
    });
  }

  Future<void> addSSubject(SubjectStudent sstudent) async {
    emit(SubjectSListLoading());
    Map<String, dynamic> data1 = sstudent.toJson();
    debugPrint(data1.toString());
    var result = await fetchStudentSubjectUseCase.callAdd(data1);

    result.fold((failure) {

        emit(SubjectSListFailure(failure.message));
    }, (sstudent) {
      emit(SubjectSListSuccess(sstudent));
    });
  }


}
