import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/my_subject/domain/use_cases/fetch_home_use_case.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/delete_cubit/delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit(
      this.fetchHomeUseCase,

      ) : super(DeleteInitial());

  final FetchHomeUseCase fetchHomeUseCase;

  Future<List<Subject>?> fetchDeleteMySubject(int sub_id) async {
    emit(DeleteLoading());

    var result = await fetchHomeUseCase.callDeleteMySubject(sub_id);

    result.fold((failure) {
      emit(DeleteFailure(failure.message));
    }, (subject) {
      emit(DeleteSuccess(subject));
    });
  }

}
