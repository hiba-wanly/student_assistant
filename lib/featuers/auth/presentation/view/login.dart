import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/button_loading.dart';
import 'package:student_register/core/widgets/custom_button_auth.dart';
import 'package:student_register/core/widgets/custom_textform_auth.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:student_register/featuers/auth/presentation/manager/cubit/auth_state.dart';
import 'package:student_register/featuers/student_info/presentation/view/load_student_info.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // bool _isHovering = false;
  double h = 1;
  bool ispassword = true;
  double w = 1;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "تسجيل دخول",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            //     .symmetric(
            //
            //     horizontal: 30
            // ),
            child: Center(
              child: ListView(
                children: [
                  SizedBox(height: h * 0.05),
                  CustomTextFormAuth(
                    hintText: 'أدخل اسم المستخدم',
                    labeltext: 'اسم المستخدم',
                    iconData: Icons.person,
                    mycontroller: usernameController,
                    textInputType: TextInputType.emailAddress,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: "أدخل كلمة المرور",
                    labeltext: "كلمة المرور",
                    iconData: Icons.lock_outline,
                    mycontroller: passwordcontroller,
                    textInputType: TextInputType.visiblePassword,
                    pass: true,
                    ispassword: ispassword,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(color: Colors.blue,fontFamily: Almarai,),
                    ),
                  ),

                  BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Get.offAll(LoadStudentInfo());
                        }
                        if (state is AuthFailure) {
                          // debugPrint("kkkLoginFailure");
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
                      return ButtonLoading();
                    } else {
                      return
                        CustomButtonAuth(
                          text: 'تسجيل دخول',
                          onPressed: () {



                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .fetchLoginData({
                                'username': usernameController.text,
                                'password': passwordcontroller.text




                              });
                            }
                          },
                        );
                    }
                  }),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
