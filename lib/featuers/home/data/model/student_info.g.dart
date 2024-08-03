// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentInfoModelAdapter extends TypeAdapter<StudentInfoModel> {
  @override
  final int typeId = 1;

  @override
  StudentInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentInfoModel(
      student: fields[1] as dynamic,
      academic_year: fields[2] as dynamic,
      exam_number: fields[3] as dynamic,
    )..id = fields[0] as dynamic;
  }

  @override
  void write(BinaryWriter writer, StudentInfoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.student)
      ..writeByte(2)
      ..write(obj.academic_year)
      ..writeByte(3)
      ..write(obj.exam_number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
