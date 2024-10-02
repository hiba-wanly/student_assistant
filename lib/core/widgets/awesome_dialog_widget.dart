import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/text_style.dart';

class AwesomeDialogWidget{
  static void show(BuildContext context, String message, void Function()? onPressed) {
    AwesomeDialog(
      context: context,
      borderSide: const BorderSide(color: kButtonColorGreen1, width: 2),
      dialogType: DialogType.noHeader,
      showCloseIcon: true,
      body: TEXT(text: message, w: MediaQuery.of(context).size.width * 0.035),
      btnCancelOnPress: () {},
      btnOkOnPress: onPressed,
    ).show();
  }
}


//     extends StatefulWidget {
//   String t;
//   final void Function()? onPressed;
//    AwesomeDialogWidget({Key? key , this.onPressed, required this.t}) : super(key: key);
//
//   @override
//   State<AwesomeDialogWidget> createState() => _AwesomeDialogWidgetState();
// }
//
// class _AwesomeDialogWidgetState extends State<AwesomeDialogWidget> {
//   double h =1;
//   double w=1 ;
//   void _showDialog() {
//     AwesomeDialog(
//       context: context,
//       borderSide: const BorderSide(color: kButtonColorGreen1, width: 2),
//       dialogType: DialogType.noHeader,
//       showCloseIcon: true,
//       body: TEXT(text: widget.t, w: w * 0.035),
//       btnCancelOnPress: () {},
//       btnOkOnPress: widget.onPressed,
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return  ElevatedButton(
//       onPressed: _showDialog, // Call the function to show the dialog
//       child: Text("Show Dialog"), // Replace with your desired button text
//     );
//   }
// }
