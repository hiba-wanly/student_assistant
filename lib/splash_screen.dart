import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/widgets/loading_page.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_state.dart';
import 'package:student_register/featuers/student_info/presentation/view/load_student_info.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DepartmentCubit>(context).fetchDepartmentData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(

      builder: (context, state) {
        if (state is DepartmentSuccess) {
          BlocProvider.of<DepartmentCubit>(context)
              .updateDepartment(state.departments);
         bool loggin = BlocProvider
              .of<AuthCubit>(context).isLoggedIn;
          return
            // WelcomeView();
            loggin ? LoadStudentInfo() : WelcomeView();

        }
        else if (state is DepartmentFailure) {

          return SplashScreen();}

        else {
          return Scaffold(
              backgroundColor : Colors.white,
              body: LoadingPage());
        }
      },
    );
  }
}


