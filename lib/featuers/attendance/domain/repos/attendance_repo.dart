import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';

abstract class AttendanceRepo {
  Future<Either<ServerFailure, List<Attendance>>> fetchGetAttendance( int sub_id);
}
