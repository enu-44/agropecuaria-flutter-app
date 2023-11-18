// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/account_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountHiveAdapter extends TypeAdapter<AccountEntityHive> {
  @override
  final int typeId = HiveTypeIdConst.TypeAccountHive;

  @override
  AccountEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountEntityHive(
        fullName: fields[0] as String,
        userName: fields[1] as String,
        password: fields[2] as String);
  }

  @override
  void write(BinaryWriter writer, AccountEntityHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
