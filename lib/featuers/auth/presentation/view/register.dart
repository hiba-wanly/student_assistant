import 'package:another_flushbar/flushbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/box_controller.dart';
import 'package:student_register/core/widgets/button.dart';
import 'package:student_register/core/widgets/button_loading.dart';
import 'package:student_register/core/widgets/custom_button_auth.dart';
import 'package:student_register/core/widgets/custom_textform_auth.dart';
import 'package:student_register/core/widgets/drop_down_widget.dart';
import 'package:student_register/core/widgets/loading.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_state.dart';
import 'package:student_register/featuers/departments/data/models/department_model.dart';
import 'package:student_register/featuers/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:student_register/featuers/student_info/presentation/view/load_student_info.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var SectionList;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController fatherController = new TextEditingController();

  List<Departments> _section = [];
  String? selecteSectionString;
  var formkey = GlobalKey<FormState>();

  String? selectedSection;

  int currentYear = DateTime.now().year;

  int currentStep = 0;

  bool ispassword = true;

  int? selectedDepartmentId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _section = BlocProvider.of<DepartmentCubit>(context).department;
  }
  var _sectionList;
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    _sectionList = _section.map<DropdownMenuItem<String>>(
            (Departments department) {
          return DropdownMenuItem<String>(
              value: department.name,
              child:
              TEXT(text: department.name, w: w * 0.035));
        }).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "تسجيل الطالب",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(
                // top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: Form(
              key: formkey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),
                    CustomTextFormAuth(
                      hintText: "أدخل اسم المستخدم",
                      labeltext: "اسم المستخدم",
                      iconData: Icons.person,
                      mycontroller: usernameController,
                      textInputType: TextInputType.text,
                      pass: false,
                      ispassword: ispassword,
                    ),
                    CustomTextFormAuth(
                      hintText: 'أنشئ بريدك الالكتروني',
                      labeltext: 'البريد الالكتروني',
                      iconData: Icons.email_outlined,
                      mycontroller: emailController,
                      textInputType: TextInputType.emailAddress,
                      pass: false,
                      ispassword: ispassword,
                    ),
                    CustomTextFormAuth(
                      hintText: "أدخل كلمة المرور",
                      labeltext: "كلمة المرور",
                      iconData: Icons.lock_outline,
                      mycontroller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      pass: true,
                      ispassword: ispassword,
                    ),
                    CustomTextFormAuth(
                      hintText: 'أدخل الاسم الاول',
                      labeltext: 'الاسم الاول',
                      iconData: Icons.person,
                      mycontroller: firstnameController,
                      textInputType: TextInputType.text,
                      pass: false,
                      ispassword: ispassword,
                    ),
                    CustomTextFormAuth(
                      hintText: 'أدخل اسم الاب',
                      labeltext: 'اسم الاب',
                      iconData: Icons.person,
                      mycontroller: fatherController,
                      textInputType: TextInputType.text,
                      pass: false,
                      ispassword: ispassword,
                    ),
                    CustomTextFormAuth(
                      hintText: 'أدخل الكنية',
                      labeltext: ' الكنية',
                      iconData: Icons.person,
                      mycontroller: lastnameController,
                      textInputType: TextInputType.text,
                      pass: false,
                      ispassword: ispassword,
                    ),
                    TEXT(
                      text: 'القسم * ',
                      w: w * 0.035,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    _section.isEmpty
                        ? Text('No departments available')
                        : DropDownWidget(
                            list: _sectionList,
                            w: w * 0.5,
                            text: 'القسم',
                            selected:selecteSectionString,
                            // _section
                            //     .firstWhere(
                            //         (dept) => dept.id == selectedDepartmentId,
                            //         orElse: () => _section[0])
                            //     .name,
                            onChanged: (value) {
                              setState(() {
                                selecteSectionString = value;
                                selectedDepartmentId = _section
                                    .firstWhere((dept) => dept.name == value)
                                    .id;
                              });
                              print(selectedDepartmentId);
                            },
                          ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                      if (state is AuthLoading) {
                        return ButtonLoading();

                        // Loading(h: h, w: w);
                      } else {
                        return CustomButtonAuth(
                          text: 'تأكيد',
                          onPressed: () {
                            if (formkey.currentState!.validate() &&
                                selectedDepartmentId! != null) {
                              BlocProvider.of<AuthCubit>(context)
                                  .fetchSignupData({
                                "username": usernameController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                                "first_name": firstnameController.text,
                                "last_name": lastnameController.text,
                                "father_name": fatherController.text,
                                "departments": selectedDepartmentId
                              });
                            }
                          },
                        );
                      }
                    }, listener: (context, state) {
                      if (state is AuthSuccess) {
                        // Flushbar(
                        //   duration: const Duration(seconds: 3),
                        //   backgroundColor: Colors.white,
                        //   messageColor: Colors.black,
                        //   messageSize: h * 0.02,
                        //   message: "تمت العملية بنجاح",
                        // ).show(context);

                        Get.offAll(LoadStudentInfo());
                      }
                      if (state is AuthFailure) {
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message: state.errMessage,
                        ).show(context);
                      }
                    })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
