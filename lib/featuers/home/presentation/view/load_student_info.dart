import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/box_controller_hint.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/home/data/model/student_info.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/state.dart';
import 'package:student_register/featuers/mysubject/presentation/view/my_subject.dart';
import 'package:student_register/repository.dart';


class LoadStudentInfo extends StatefulWidget {
  Repository repository;
  LoadStudentInfo({Key? key, required this.repository}) : super(key: key);

  @override
  _LoadStudentInfoState createState() => _LoadStudentInfoState();
}

class _LoadStudentInfoState extends State<LoadStudentInfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SSCubit>(context).getStudentInfo( widget.repository.login!.id);
  }

  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return  BlocConsumer<SSCubit, ListState>(
      listener: (context, state){
        if (state is StudentInfoListFailure) {
          Flushbar(
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.white,
            messageColor: Colors.black,
            messageSize: h * 0.02,
            message: "لا يمكن تحميل بيانات الطالب ",
          ).show(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MySubject(repository: widget.repository)
            ),
          );
        }
        if (state is StudentInfoListSuccess) {
          widget.repository.studentinfomodel = state.studentinfo;
          // return MySubject(repository: widget.repository,);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MySubject(repository: widget.repository)
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
