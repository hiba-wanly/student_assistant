import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';
import 'package:student_register/featuers/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit(this.fetchDepartmentUseCase,

  ) : super(DepartmentInitial());

  final FetchDepartmentUseCase fetchDepartmentUseCase;
  late List<Departments> department =[];


  Future<List<Departments>?> fetchDepartmentData() async {
    emit(DepartmentLoading());

    var result = await fetchDepartmentUseCase.callDepartment();

    result.fold((failure) {
      emit(DepartmentFailure(failure.message));
    }, (department) {
      emit(DepartmentSuccess(department));
    });
  }




  void updateDepartment(List<Departments> newDepartments) {
    department = newDepartments;
    emit(DepartmentSuccess(department));
  }


}
