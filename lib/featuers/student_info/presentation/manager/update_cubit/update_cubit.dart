import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/featuers/student_info/data/model/student_info.dart';
import 'package:student_register/featuers/student_info/domain/use_cases/fetch_use_case.dart';
import 'package:student_register/featuers/student_info/presentation/manager/update_cubit/update_state.dart';

class UpdateStudentInfoListCubit extends Cubit<UpdateStudentInfoListState>{
  UpdateStudentInfoListCubit( this.fetchStudentInfoUseCase,
      ) : super(UpdateStudentInfoListInitial());


  final FetchStudentInfoUseCase fetchStudentInfoUseCase;



  Future<void> updateStudentInfo(StudentInfoModel studentInfo) async{
    emit(UpdateStudentInfoListLoading());
    Map<String, dynamic> data1 = studentInfo.toJson();
    debugPrint(data1.toString());
    var result = await  fetchStudentInfoUseCase.callupdateStudentInfo(data1);

    result.fold((failure) {

      emit(UpdateStudentInfoListFailure(failure.message));
    }, (student) {
      emit(UpdateStudentInfoListSuccess(student));
    });
  }


}