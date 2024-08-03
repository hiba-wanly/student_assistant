import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/button.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/loading.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/home/presentation/manager/cubit/cubit.dart';
import 'package:student_register/featuers/mysubject/data/model/subject.dart';
import 'package:student_register/featuers/mysubject/presentation/manager/cubit/subject_cubit.dart';
import 'package:student_register/featuers/mysubject/presentation/manager/cubit/subject_state.dart';
import 'package:student_register/featuers/mysubject/presentation/view/add_subject.dart';
import 'package:student_register/featuers/home/presentation/view/student_info.dart';
import 'package:student_register/repository.dart';


class MySubject extends StatefulWidget {
  Repository repository;
   MySubject({Key? key,required this.repository}) : super(key: key);

  @override
  _MySubjectState createState() => _MySubjectState();
}

class _MySubjectState extends State<MySubject> {





  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: h*0.09,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0x24F10808),
          title:  TEXT(text: '${widget.repository.login!.firstName} ${widget.repository.login!.lastName}', w: w * 0.05),
          centerTitle: true,
          actions: [
            IconButton(
              padding: EdgeInsets.only(top: h * 0.02),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentInfo(repository:  widget.repository,),
                  ),
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: w * 0.06,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        child:  Container()
    ),
        floatingActionButton: FloatingActionButton(
          highlightElevation: 0.5,
          disabledElevation: 0.5,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddSubject(repository:  widget.repository,),
              ),
            );
          },
          backgroundColor: const Color(0x24F10808),
          child: const Icon(
              Icons.add
          ),
        ),
      ),
    );
  }



}
