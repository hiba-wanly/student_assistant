import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';

class PracticalView extends StatefulWidget {
  List<Attendance> listLab;
  int subjectId;
  PracticalView({required this.subjectId, required this.listLab});
  @override
  State<PracticalView> createState() => _PracticalViewState();
}

class _PracticalViewState extends State<PracticalView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
      child: widget.listLab.isEmpty
          ? Center(child: Text("No data available"))
          : ListView.builder(
        itemCount: widget.listLab.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            color: Colors.white,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (widget.listLab[index].status == 'attended')
                    Icon(Icons.check_circle, color: Colors.green),
                  if (widget.listLab[index].status == 'reason')
                    Icon(Icons.info, color: Colors.blue),
                  if (widget.listLab[index].status == 'late')
                    Icon(Icons.access_time, color: Colors.orange),
                  if (widget.listLab[index].status == '')
                    Icon(Icons.cancel, color: Colors.red),
                  Text(
                    textAlign: TextAlign.center,
                    widget.listLab[index].date +  " "+
                        widget.listLab[index].day, // Display the formatted date
                    style: TextStyle(
                      fontSize: w * 0.04,
                      fontFamily: Almarai,
                    ),
                  ),

                ],
              ),
              onTap: () {},
            ),
            // Divider(),
          );
        },
      ),
    );
  }
}
