// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiplication.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MultiplicationAdapter extends TypeAdapter<Multiplication> {
  @override
  final int typeId = 1;

  @override
  Multiplication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Multiplication(
      firstValue: fields[0] as int,
      secondValue: fields[1] as int,
      attempts: fields[3] as int,
      isCorrect: fields[4] as bool,
      createdAt: fields[5] as DateTime,
    )..timeTaken = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, Multiplication obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstValue)
      ..writeByte(1)
      ..write(obj.secondValue)
      ..writeByte(2)
      ..write(obj.timeTaken)
      ..writeByte(3)
      ..write(obj.attempts)
      ..writeByte(4)
      ..write(obj.isCorrect)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiplicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
