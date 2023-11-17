// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/animal_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalHiveAdapter extends TypeAdapter<AnimalEntityHive> {
  @override
  final int typeId = HiveTypeIdConst.TypeAnimalHive;

  @override
  AnimalEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalEntityHive(
        accountId: fields[0] as String,
        animalTypeId: fields[1] as String,
        name: fields[2] as String,
        code: fields[3] as String,
        sexo: fields[4] as String,
        race: fields[5] as String,
        color: fields[6] as String,
        earringNumber: fields[8] as String?,
        lote: fields[9] as String?,
        characteristics: fields[10] as String?,
        photoBase64: fields[11] as String?)
      ..createdDate = DateTime.fromMillisecondsSinceEpoch(fields[7] as int);
  }

  @override
  void write(BinaryWriter writer, AnimalEntityHive obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.animalTypeId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.sexo)
      ..writeByte(5)
      ..write(obj.race)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.createdDate.millisecondsSinceEpoch)
      ..writeByte(8)
      ..write(obj.earringNumber)
      ..writeByte(9)
      ..write(obj.lote)
      ..writeByte(10)
      ..write(obj.characteristics)
      ..writeByte(11)
      ..write(obj.photoBase64);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
