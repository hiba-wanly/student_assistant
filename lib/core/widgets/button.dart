import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';

class Button extends StatelessWidget {
  double h;
  double w;
  String text;
   Button({Key? key, required this.h, required this.w
   , required this.text}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      // margin: EdgeInsets.only(
      // //   left: w * 0.005,
      // //   // right: w * 0.05,
      // //   bottom: w * 0.05,
      //   top:  w * 0.09,),
      height:  h * 0.05,
      width: w * 0.2,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(w* 0.015),
          boxShadow: kElevationToShadow[2]),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: w * 0.04,
            fontFamily: Almarai,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
