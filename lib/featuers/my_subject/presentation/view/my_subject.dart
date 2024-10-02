import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/awesome_dialog_widget.dart';
import 'package:student_register/core/widgets/loading_page.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/add_subject/presentation/view/add_subject.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_state.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/cubit/home_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/cubit/home_state.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/delete_cubit/delete_cubit.dart';
import 'package:student_register/featuers/my_subject/presentation/manager/delete_cubit/delete_state.dart';
import 'package:student_register/featuers/my_subject/presentation/view/subject_detail.dart';
import 'package:student_register/featuers/student_info/presentation/view/student_info.dart';
import 'package:student_register/featuers/welcome/presentations/views/welcome_views.dart';
import 'package:student_register/splash_screen.dart';

class MySubject extends StatefulWidget {
  MySubject({
    Key? key,
  }) : super(key: key);

  @override
  _MySubjectState createState() => _MySubjectState();
}

class _MySubjectState extends State<MySubject> {
  double h = 1;
  double w = 1;
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();
  late List<Subject> subjects = [];
  int? loadingIndex;

  List<Departments> _section = [];
  List<AcademicSemester> AcademicYear = academicYearCon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchMySubjectData();
  }

  Future<void> _refresh() async {
    // Call your Bloc method to fetch data
    await BlocProvider.of<HomeCubit>(context).fetchMySubjectData();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    _section = BlocProvider.of<DepartmentCubit>(context).department;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _sKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // toolbarHeight: h * 0.09,
          automaticallyImplyLeading: false,
          // backgroundColor: kButtonColorBlue1,
          title: TEXT(
              text:
                  '${BlocProvider.of<AuthCubit>(context).first_name} ${BlocProvider.of<AuthCubit>(context).last_name}',
              w: w * 0.05),
          centerTitle: true,
          actions: [
            IconButton(
              padding: EdgeInsets.only(top: h * 0.02),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentInfo(),
                  ),
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: w * 0.06,
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(
// top: 8.0
                  top: h * 0.005),
              onPressed: () {
                _sKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size:
// 30,
                w * 0.09,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.1, 0.6],
                tileMode: TileMode.repeated,
                colors: [kButtonColorGreen1, kButtonColorGreen2],
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
            if (state is HomeFailure) {

              debugPrint("kkkSubjectFailure");
                Flushbar(
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.white,
                  messageColor: Colors.black,
                  messageSize: h * 0.02,
                  message: state.errMessage,
                ).show(context);
              // Navigator.pop(context);
            }
          }, builder: (context, state) {
            if (state is HomeSuccess) {
              subjects = state.subject;
              BlocProvider.of<HomeCubit>(context).updateSubject(state.subject);
              return ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(SubjectDetails(subject:
                      subjects[index]));
                    },
                    child: Container(
                      height: h * 0.15,
                      margin:
                      EdgeInsets.symmetric(vertical:  h * 0.014, horizontal: w*0.04),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: kButtonColorGreen1,
                            width: 6,
                          ),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: w*0.02),
                              Flexible(
                                child: Text(
                                  subjects[index].subjectName ?? "",
                                  style: TextStyle(
                                    fontSize: w*0.04,
                                    fontFamily: Almarai,
                                  ),
                                ),
                              ),

                              BlocConsumer<DeleteCubit, DeleteState>(
                                  listener: (context, state) {
                                    if (state is DeleteSuccess) {
                                      BlocProvider.of<HomeCubit>(context)
                                          .updateSubject(state.subject);
                                      setState((){
                                        subjects = BlocProvider
                                            .of<HomeCubit>(context).subject;
                                      });

                                      // update list of subject
                                      // Get.off(HomeView());
                                    }
                                    if (state is DeleteFailure) {

                                      // debugPrint("kkkSubjectFailure");
                                        Flushbar(
                                          duration: const Duration(seconds: 3),
                                          backgroundColor: Colors.white,
                                          messageColor: Colors.black,
                                          messageSize: h * 0.02,
                                          message: state.errMessage,
                                        ).show(context);
                                      // Navigator.pop(context);
                                    }
                                  }, builder: (context, state) {
                                if (state is DeleteLoading) {
                                  return InkWell(
                                    onTap: () {
                                    },
                                    child: loadingIndex == index
                                        ? CircularProgressIndicator(color: kButtonColorGreen1) :
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      AwesomeDialogWidget.show(
                                        context,
                                        'هل أنت متأكد من حذف المادة',
                                            () {
                                          setState(() {
                                            loadingIndex = index; // Track the pressed button
                                          });
                                          BlocProvider.of<DeleteCubit>(context)
                                              .fetchDeleteMySubject(subjects[index].id);
                                        },
                                      );
                                      // AwesomeDialogWidget(
                                      //     onPressed:(){
                                      //       setState(() {
                                      //         loadingIndex = index; // Track the pressed button
                                      //       });
                                      //       BlocProvider.of<DeleteCubit>(context)
                                      //           .fetchDeleteMySubject(subjects[index].id);
                                      //     }, t: 'هل أنت متأكد من حذف المادة',
                                      // );
                                      // setState(() {
                                      //   loadingIndex = index; // Track the pressed button
                                      // });

                                      // debugPrint("clicked");
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  );
                                }
                              }),

                            ],
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        _section
                                            .firstWhere(
                                              (dept) =>
                                          dept.id ==
                                              subjects[index].departments,
                                          // orElse: () => _section[0]
                                        )
                                            .name,
                                        // subjects[index].departments.toString(),
                                        style: TextStyle(
                                          fontFamily: Almarai,
                                        )),
                                    Text(
                                        AcademicYear
                                            .firstWhere(
                                              (ac) => ac.id == subjects[index].academicYear,
                                          orElse: () => AcademicYear[0]
                                        )
                                            .acadsemester  ?? "",

                                        // subjects[index]?.academicYear ?? "",
                                        style: TextStyle(
                                          fontFamily: Almarai,
                                        )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else
              return LoadingPage();
          }),
        ),
        floatingActionButton: FloatingActionButton(
          highlightElevation: 0.5,
          disabledElevation: 0.5,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddSubject(),
              ),
            );
          },
          backgroundColor: kButtonColorGreen1,
          child:  Icon(Icons.add, color:Colors.black),
        ),
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: <Widget>[
                DrawerHeader(
                    child: Column(
                  children: [
                    Text(BlocProvider.of<AuthCubit>(context).first_name,
                        style: TextStyle(
                          fontFamily: Almarai,
                        )),
                  ],
                )),
                ListTile(
                  title: Text("موادي",
                      style: TextStyle(
                        fontFamily: Almarai,
                      )),
                  onTap: () {
                    Get.offAll(MySubject());
                  },
                ),

                BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                  if (state is AuthSuccess) {
                    Get.to(SplashScreen());
                  }

                  if (state is AuthFailure) {
                    Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: state.errMessage,
                      ).show(context);
                    // Navigator.pop(context);
                  }
                }, builder: (context, state) {
                  if (state is AuthLoading) {
                    return ListTile(
                      leading: CircularProgressIndicator(color:kButtonColorGreen1),
                      title: Text("تسجيل خروج",
                          style: TextStyle(
                            fontFamily: Almarai,
                          )),
                      onTap: () {},
                    );
                  } else {
                    return ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("تسجيل خروج",
                          style: TextStyle(
                            fontFamily: Almarai,
                          )),
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context).logout();
                      },
                    );
                  }
                }),
              ],
            )),
      ),
    );
  }
}
