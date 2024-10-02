import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/featuers/auth/domain/use_cases/fetch_login_use_case.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.fetchAuthUseCase,
      {
    required this.isLoggedIn,
    required this.user_id,
    required this.student_id,
    required this.userName,
    required this.email,
    required this.first_name,
        required this.last_name,
        required this.father_name,
        required this.department_id,
  }) : super(AuthInitial());

  final FetchAuthUseCase fetchAuthUseCase;


  late bool isLoggedIn;
  late String user_id;
  late String student_id;
  late String userName;
  late String email;
  late String first_name;
  late String last_name;
  late String father_name;
  late String department_id;


  Future<void> fetchLoginData(Map<String, dynamic> data) async {
    emit(AuthLoading());

    var result = await fetchAuthUseCase.callLogin(data);

    result.fold((failure) {
      emit(AuthFailure(failure.message));
    }, (login) {
      updateData();
      emit(AuthSuccess(login));
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    var result = await fetchAuthUseCase.callLogout();

    result.fold((failure) {
        emit(AuthFailure(failure.message));
    }, (login) {
      isLoggedIn = false;
      removeToken();
      emit(AuthSuccess(login));
    });
  }

  Future<void> fetchSignupData(Map<String, dynamic> data) async {
    emit(AuthLoading());

    var result = await fetchAuthUseCase.callSignUp(data);

    result.fold((failure) {
      emit(AuthFailure(failure.message));
    }, (signup) {
      updateData();
      emit(AuthSuccess(signup));
    });
  }

  updateData() async {
     String? user_idS =
     (await SharedPreferences.getInstance()).getString("user_id");
     String? student_idS =
     (await SharedPreferences.getInstance()).getString("student_id");
     String? userNameS =
     (await SharedPreferences.getInstance()).getString("userName");
     String? emailS = (await SharedPreferences.getInstance()).getString("email");
     String? first_nameS =
     (await SharedPreferences.getInstance()).getString("first_name");
     String? last_nameS =
     (await SharedPreferences.getInstance()).getString("last_name");
     String? father_nameS =
     (await SharedPreferences.getInstance()).getString("father_name");
     String? department_idS =
     (await SharedPreferences.getInstance()).getString("department_id");

     user_id = user_idS!;
      student_id = student_idS!;
      userName = userNameS!;
      email = emailS!;
      first_name = first_nameS!;
      last_name = last_nameS!;
      father_name = father_nameS!;
      department_id = department_idS!;
  }


  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("user_id");
    await prefs.remove("student_id");
    await prefs.remove("userName");
    await prefs.remove("email");
    await prefs.remove("first_name");
    await prefs.remove("last_name");
    await prefs.remove("father_name");
    await prefs.remove("department_id");
    await prefs.remove("academic_year");
    await prefs.remove("exam_number");
    // Removes the token
  }

}
