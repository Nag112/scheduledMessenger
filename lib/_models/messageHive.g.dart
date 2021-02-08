// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageHiveAdapter extends TypeAdapter<MessageHive> {
  @override
  final int typeId = 2;

  @override
  MessageHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageHive(
      users: fields[0] as List,
      sId: fields[1] as String,
      time: fields[2] as int,
      message: fields[3] as String,
      createdAt: fields[4] as String,
      updatedAt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MessageHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.users)
      ..writeByte(1)
      ..write(obj.sId)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
