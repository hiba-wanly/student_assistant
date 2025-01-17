import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:student_register/core/widgets/text_style.dart';

class DropDownWidget extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? list;
  var selected;
  double w;
  final String text;
  final ValueChanged<dynamic?>? onChanged;
  // final VoidCallback? onChanged;
  DropDownWidget(
      {super.key,
      required this.list,
      required this.selected,
      required this.w,
      required this.text,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      // margin: const EdgeInsets.all(10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          alignment: Alignment.centerRight,
          isExpanded: true,
          hint: TEXT(text: text, w: w * 0.035),
          items: list,
          value: selected,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            height: MediaQuery.of(context).size.height * 0.02,
            width: double.infinity,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.white,
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
