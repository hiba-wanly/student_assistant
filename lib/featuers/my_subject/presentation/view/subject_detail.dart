import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/core/widgets/custom_appbar.dart';
import 'package:student_register/core/widgets/text_style.dart';
import 'package:student_register/featuers/add_subject/data/model/subject.dart';
import 'package:student_register/featuers/attendance/presentations/views/attendance_view.dart';

class SubjectDetails extends StatefulWidget {
  Subject subject;
  SubjectDetails({super.key, required this.subject});

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  double h = 1;
  double w = 1;
  late final List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    // Initialize items in initState
    items = [
      {'name': 'الحضور', 'screen': AttendanceView(subject: widget.subject)},
    ];
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: CustomAppBar(text: widget.subject.subjectName, h: h, w: w),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => items[index]['screen']),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    margin: EdgeInsets.symmetric(
                        vertical: h * 0.014, horizontal: w * 0.04),
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
                    child: Center(
                        child: Text(
                      items[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Almarai,
                      ),
                    )),
                  ),
                );
              },
            )));
  }
}
