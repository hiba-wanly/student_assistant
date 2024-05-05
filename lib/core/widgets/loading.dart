import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  double h  ;
  double w;
   Loading({Key? key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return
        Container(
      height:  h * 0.05,
      width: w * 0.2,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(
              w * 0.015),
          boxShadow: kElevationToShadow[2]),
      child: Center(
        child: Padding(
          padding:
          EdgeInsets.only(
              top: h * 0.009, bottom: h * 0.009,left: w * 0.065,right: w * 0.065
          ),
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
