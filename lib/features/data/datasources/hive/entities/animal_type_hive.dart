import 'dart:typed_data';

import 'package:agropecuariosapp/features/data/datasources/hive/constant/hive_typeid_const.dart';
import 'package:hive/hive.dart';

part '../adapters/animal_type_hive.adapter.dart';

@HiveType(
    adapterName: 'AnimalTypeHiveAdapter',
    typeId: HiveTypeIdConst.TypeAnimalTypeHive)
class AnimalTypeEntityHive extends HiveObject {
  AnimalTypeEntityHive({required this.name, required this.path});
  @HiveField(0)
  String name;

  @HiveField(1)
  String path;
}
