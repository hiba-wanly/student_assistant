import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  double h = 1;
  double w =1;
   String text;
   CustomAppBar({super.key,required this.h, required this.text, required this.w});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(h * 0.065);
}

class _CustomAppBarState extends State<CustomAppBar> {
  // double h = 1;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(

      preferredSize: Size.fromHeight(widget.h*0.065),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.of(context).pop(); // Pop the current route
          },
        ),
        title: Text(widget.text,textAlign:TextAlign.center, style:TextStyle(
          fontSize: widget.w * 0.04
        )),
        centerTitle : true,
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
    );
  }
}
