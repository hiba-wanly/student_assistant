import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/core/widgets/loading_page.dart';
import 'package:student_register/featuers/my_subject/presentation/view/my_subject.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/student_info/presentation/manager/cubit/state.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';


class LoadStudentInfo extends StatefulWidget {
  LoadStudentInfo({Key? key, }) : super(key: key);

  @override
  _LoadStudentInfoState createState() => _LoadStudentInfoState();
}

class _LoadStudentInfoState extends State<LoadStudentInfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<StudentInfoListCubit>(context).getStudentInfo();
  }

  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    debugPrint("load student info");
    return  BlocBuilder<StudentInfoListCubit, StudentInfoListState>(

      builder: (context, state) {

        if (state is StudentInfoListFailure) {

          // Flushbar(
          //     duration: const Duration(seconds: 3),
          //     backgroundColor: Colors.white,
          //     messageColor: Colors.black,
          //     messageSize: h * 0.02,
          //     message: state.errMessage,
          //   ).show(context);

            return LoadStudentInfo();
          }


        if (state is StudentInfoListSuccess) {
          // return MySubject(repository: widget.repository,);
          BlocProvider.of<StudentInfoListCubit>(context)
              .updateStudentInfoLocal(state.studentinfo);
          debugPrint("data  "+BlocProvider.of<StudentInfoListCubit>(context).studentInfoB.exam_number.toString());
          return MySubject();

        }

       else {
          return Scaffold(backgroundColor: Colors.white, body: LoadingPage());
        }
      },

    );
  }
}

