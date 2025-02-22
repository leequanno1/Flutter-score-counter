// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogItemAdapter extends TypeAdapter<LogItem> {
  @override
  final int typeId = 1;

  @override
  LogItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogItem(
      content: fields[0] as String,
      initDate: fields[1] as DateTime,
      logType: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LogItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.initDate)
      ..writeByte(2)
      ..write(obj.logType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
