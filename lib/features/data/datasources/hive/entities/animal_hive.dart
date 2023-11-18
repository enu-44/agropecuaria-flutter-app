import 'dart:typed_data';

import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_typeid_const.dart';

import 'package:hive/hive.dart';

part '../adapters/animal_hive.adapter.dart';

@HiveType(
    adapterName: 'AnimalHiveAdapter', typeId: HiveTypeIdConst.TypeAnimalHive)
class AnimalEntityHive extends HiveObject {
  AnimalEntityHive(
      {required this.accountId,
      required this.animalTypeId,
      required this.name,
      required this.code,
      required this.sexo,
      required this.race,
      required this.color,
      this.earringNumber,
      this.lote,
      this.characteristics,
      this.photo}) {
    createdDate = DateTime.now();
  }

  @HiveField(0)
  String accountId;

  @HiveField(1)
  int animalTypeId;

  @HiveField(2)
  String name;

  @HiveField(3)
  String code;

  @HiveField(4)
  String sexo;

  @HiveField(5)
  String race;

  @HiveField(6)
  String color;

  @HiveField(7)
  late DateTime createdDate;

  @HiveField(8)
  String? earringNumber;

  @HiveField(9)
  String? lote;

  @HiveField(10)
  String? characteristics;

  @HiveField(11)
  Uint8List? photo;
}
