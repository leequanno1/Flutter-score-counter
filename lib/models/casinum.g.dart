// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casinum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CasinumAdapter extends TypeAdapter<Casinum> {
  @override
  final int typeId = 0;

  @override
  Casinum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Casinum(
      id: fields[0] as int,
      name: fields[1] as String,
      delFlg: fields[2] as bool,
      deafaultBet: fields[3] as int,
      initDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Casinum obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.delFlg)
      ..writeByte(3)
      ..write(obj.deafaultBet)
      ..writeByte(4)
      ..write(obj.initDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CasinumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
