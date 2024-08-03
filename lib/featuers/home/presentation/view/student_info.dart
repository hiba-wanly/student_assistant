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

class StudentInfo extends StatefulWidget {
  Repository repository;
   StudentInfo({Key? key, required this.repository}) : super(key: key);

  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {

  late StudentInfoModel studentinfo;

  TextEditingController exam_numberController = new TextEditingController();
  TextEditingController academic_yearController = new TextEditingController();
  var AcademicYearList;
  List<String> AcademicYear = ["أولى", "ثانية", "ثالثة", "رابعة", "خامسة"];
  String? selectedAcademicYear;
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    AcademicYearList = AcademicYear.map((e) => DropdownMenuItem<String>(
      value: e,
      child: TEXT(text: e, w: w * 0.035),
    )).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: h*0.09,
        backgroundColor: Color(0x24F10808),
        title:  TEXT(text: 'استكمال بيانات الطالب', w: w * 0.05),
        centerTitle: true,

      ),
      body:SingleChildScrollView(
    padding: EdgeInsets.only(
    top: MediaQuery.of(context).size.height * 0.05,
    bottom: MediaQuery.of(context).size.height * 0.1,
    left: MediaQuery.of(context).size.width * 0.05,
    right: MediaQuery.of(context).size.width * 0.05),
    child: Container(
    child:Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      TEXT(
        text: ' الطالب ',
        w: w * 0.04,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      TEXT(
        text: widget.repository.login!.firstName! +' '+ widget.repository.login!.fatherName! +' '+ widget.repository.login!.lastName!,
        w: w * 0.035,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      TEXT(
        text: ' القسم ',
        w: w * 0.04,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      TEXT(
        text: widget.repository.login!.section!,
        w: w * 0.035,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      TEXT(
        text: ' الرقم الامتحاني ',
        w: w * 0.035,
      ),
      BoxControllerHint(
        controller: exam_numberController,
        h: h,
        w: w,
        label:  widget.repository.studentinfomodel! != null ? widget.repository.studentinfomodel!.exam_number.toString() : "",
        textInputType: TextInputType.text,
        validate: false,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      TEXT(
        text: ' السنة الدراسية ',
        w: w * 0.035,
      ),
      SizedBox(
        height: h * 0.03,
      ),
      DropDownWidget(
        list: AcademicYearList,
        w: w,
        text: widget.repository.studentinfomodel != null ? widget.repository.studentinfomodel!.academic_year.toString() : 'السنة الدراسية',
        selected: selectedAcademicYear,
        onChanged:  (value) {
          setState(() {
            selectedAcademicYear = value;
          });
          print(selectedAcademicYear);
        },
      ),
      SizedBox(
        height: h * 0.03,
      ),
      BlocConsumer<SSCubit,ListState>(
          builder: (context,state){
            if(state is StudentInfoListLoading){
              return  Container(
                width: w,
                height: h*0.06,
                margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
                child: MaterialButton(
                    onPressed: (){
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding:  EdgeInsets.symmetric(vertical: h*0.02),
                    color: const Color(0x24F10808),
                    textColor: Colors.white,
                    child:  Padding(
                      padding: EdgeInsets.only(left: w * 0.05,right: w * 0.05),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                ),
              );

              // Loading(h: h, w: w);
            }
            else{
              return
                Container(
                  width: w,
                  height: h*0.06,
                  margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
                  child: MaterialButton(
                    onPressed: (){
                      studentinfo = StudentInfoModel(
                        student : widget.repository.login!.id,
                        academic_year: selectedAcademicYear,
                        exam_number: exam_numberController.text,
                        );
                        // if(numberController.text != null){
                        //   student.examNumber = numberController.text;
                        // }
                        BlocProvider.of<SSCubit>(context).updateStudentInfo(studentinfo, widget.repository.login!.id);

                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding:  EdgeInsets.symmetric(vertical: h*0.02),
                    color: const Color(0x24F10808),
                    textColor: Colors.white,
                    child:  TEXT(
                      text: ' تأكيد ',
                      w: w * 0.035,
                    ),
                  ),
                )
              ;
            }
          },
          listener: (context,state){
            if(state is StudentInfoListSuccess){
              widget.repository.studentinfomodel = state.studentinfo;
              Flushbar(
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.white,
                messageColor: Colors.black,
                messageSize: h * 0.02,
                message: "تمت العملية بنجاح",
              ).show(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => MySubject(repository: widget.repository)
                ),
                ModalRoute.withName('/mySubjectView'),
              );
              // setState(() {
              //   currentStep +=1;
              // });
              // Timer( Duration(seconds: 10),() {
              //   initStatereturn();
              // });
            }
            if (state is StudentInfoListFailure){
              Flushbar(
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.white,
                messageColor: Colors.black,
                messageSize: h * 0.02,
                message: "لا يمكن اتمام العملية الان",
              ).show(context);

            }
          }
      )
    ]
    ),
    ),
      ),
    );
  }
}
