// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 0;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      id: fields[0] as int,
      name: fields[1] as String,
      picture: fields[2] as String,
      additions: fields[3] as int,
      correctAdditions: fields[4] as int,
      subtractions: fields[5] as int,
      correctSubtractions: fields[6] as int,
      multiplications: fields[7] as int,
      correctMultiplications: fields[8] as int,
      divisions: fields[9] as int,
      correctDivisions: fields[10] as int,
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.picture)
      ..writeByte(3)
      ..write(obj.additions)
      ..writeByte(4)
      ..write(obj.correctAdditions)
      ..writeByte(5)
      ..write(obj.subtractions)
      ..writeByte(6)
      ..write(obj.correctSubtractions)
      ..writeByte(7)
      ..write(obj.multiplications)
      ..writeByte(8)
      ..write(obj.correctMultiplications)
      ..writeByte(9)
      ..write(obj.divisions)
      ..writeByte(10)
      ..write(obj.correctDivisions)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
