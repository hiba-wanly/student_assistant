import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/my_subject/domain/use_cases/fetch_home_use_case.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this.fetchHomeUseCase,
  //     {
  // required this.subject,
  // }
  ) : super(HomeInitial());

  final FetchHomeUseCase fetchHomeUseCase;
  late List<Subject> subject;

  Future<List<Subject>?> fetchMySubjectData() async {
    emit(HomeLoading());

    var result = await fetchHomeUseCase.callMySubject();

    result.fold((failure) {
      emit(HomeFailure(failure.message));
    }, (subject) {
      emit(HomeSuccess(subject));
    });
  }




  void updateSubject(List<Subject> newsubject) {
    subject = newsubject;
    emit(HomeSuccess(subject));
  }


}
