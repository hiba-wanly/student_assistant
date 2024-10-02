import 'package:dartz/dartz.dart';
import 'package:student_register/core/error/failure.dart';
import 'package:student_register/featuers/attendance/data/models/attendance_model.dart';
import 'package:student_register/featuers/attendance/domain/repos/attendance_repo.dart';
import 'use_case.dart';

class FetchAttendanceUseCase extends UseCase<List<Attendance>, NoParam> {
  final AttendanceRepo attendanceRepo;
  FetchAttendanceUseCase(this.attendanceRepo);


  @override
  Future<Either<Failure, List<Attendance>>> callGetAttendance( int sub_id, [NoParam? param]) async {
    return await attendanceRepo.fetchGetAttendance(sub_id);
  }

  @override
  Future<Either<Failure, List<Attendance>>> callGetAttendanceLOG(int att_id, [NoParam? param]) {
    // TODO: implement callGetAttendanceLOG
    throw UnimplementedError();
  }
}


