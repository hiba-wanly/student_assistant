import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
class BoxControllerHint extends StatelessWidget {
  TextEditingController controller;
  double h;
  double w;
  String? label;
  TextInputType textInputType;
  bool validate;

  BoxControllerHint({Key? key, required this.controller, required this.h, required this.w,this.label, required this.textInputType, required this.validate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: w,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        // autocorrect: false,
        controller: controller,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontSize: h * 0.018,
          fontWeight: FontWeight.w500,
          fontFamily: Almarai,
          // letterSpacing: 0.1,
        ),
        keyboardType: textInputType,
        onFieldSubmitted: (val) {
          debugPrint(val);
        },
        validator: (value) {
          if(validate){
            if(value!.isEmpty || value == null){
              return "الحقل مطلوب";
            }
            return null;
          }
        },
        cursorHeight: 0,
        cursorWidth: 0,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey[900],
              fontFamily: Almarai
          ),
          filled: true,
          fillColor: Colors.white,
          // hoverColor: greybox,
          contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
