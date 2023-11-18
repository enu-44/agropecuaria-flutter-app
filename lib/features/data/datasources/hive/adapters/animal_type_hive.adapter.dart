// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/animal_type_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalTypeHiveAdapter extends TypeAdapter<AnimalTypeEntityHive> {
  @override
  final int typeId = HiveTypeIdConst.TypeAnimalTypeHive;

  @override
  AnimalTypeEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalTypeEntityHive(
        name: fields[0] as String, path: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, AnimalTypeEntityHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalTypeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
