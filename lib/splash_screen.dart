import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';
import 'package:student_register/featuers/home/presentation/view/home.dart';
import 'package:student_register/featuers/home/presentation/view/load_student_info.dart';
import 'package:student_register/featuers/mysubject/presentation/view/my_subject.dart';
import 'package:student_register/repository.dart';

class SplashScreen extends StatefulWidget {
  Repository repository;
  SplashScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SSCubit>(context).fetchLogin();
  }

  @override
  Widget build(BuildContext context) {
    return
      //  Scaffold(
      //   body: SplashViewbody(repository: widget.repository,),
      // );
      BlocConsumer<SSCubit, ListState>(
        listener: (context, state){
          if (state is StudentListFailure) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeView(repository: widget.repository)
              ),
            );
          }
                   if (state is StudentListSuccess) {
                     debugPrint(state.student.id.toString());
                     widget.repository.login = state.student;
                     // return MySubject(repository: widget.repository,);
                     Navigator.push(
                     context,
          MaterialPageRoute(
          builder: (context) => LoadStudentInfo(repository: widget.repository)
          ),
          );

                   }
        },
        builder: (context, state) {
          // if (state is StudentListSuccess) {
          //   debugPrint(state.student.id.toString());
          //   widget.repository.login = state.student;
          //   return MySubject(repository: widget.repository,);
          // }  else
          //   {
            return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
          // }
        },

      );
  }
}
