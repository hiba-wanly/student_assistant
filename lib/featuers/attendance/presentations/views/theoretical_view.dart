import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';

class TheoreticalView extends StatefulWidget {
  List<Attendance> listTheory;
  int subjectId;
  TheoreticalView({required this.subjectId, required this.listTheory});

  @override
  State<TheoreticalView> createState() => _TheoreticalViewState();
}

class _TheoreticalViewState extends State<TheoreticalView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
        child:widget.listTheory.isEmpty
            ? Center(child: Text("No data available"))
            : ListView.builder(
            itemCount: widget.listTheory.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                color: Colors.white,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (widget.listTheory[index].status == 'attended')
                        Icon(Icons.check_circle, color: Colors.green),
                      if (widget.listTheory[index].status == 'reason')
                        Icon(Icons.info, color: Colors.blue),
                      if (widget.listTheory[index].status == 'late')
                        Icon(Icons.access_time, color: Colors.orange),
                      if (widget.listTheory[index].status == '')
                        Icon(Icons.cancel, color: Colors.red),
                      Text(
                        textAlign: TextAlign.center,
                        widget.listTheory[index].date +  " "+
                            widget.listTheory[index].day +
                            " " +
                            widget.listTheory[index]
                                .status, // Display the formatted date
                        style: TextStyle(
                          fontSize: w * 0.04,
                          fontFamily: Almarai,
                        ),
                      ),

                    ],
                  ),

                  onTap: () {},
                ),
              );
            }));
  }
}
